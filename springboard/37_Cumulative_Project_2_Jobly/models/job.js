"use strict";

const {
    max
} = require("pg/lib/defaults");
const db = require("../db");
const {
    BadRequestError,
    NotFoundError
} = require("../expressError");
const {
    sqlForPartialUpdate
} = require("../helpers/sql");

/** Related functions for jobs. */

class Job {
    /** Create a job (from data), update db, return new job data.
     *
     * data should be { title, salary, equity, company_handle }
     *
     * Returns { id, title, salary, equity, company_handle }
     *
     * Throws BadRequestError if job (company_handle) already in database.
     * */

    static async create({
        title,
        salary,
        equity,
        company_handle
    }) {
        const result = await db.query(
            `INSERT INTO jobs
           (title, salary, equity, company_handle)
           VALUES ($1, $2, $3, $4)
           RETURNING id, title, salary, equity, company_handle`,
            [
                title,
                salary,
                equity,
                company_handle
            ],
        );
        const job = result.rows[0];

        return job;
    }

    /** Find all jobs.
     *
     * Returns [{ id, title, salary, equity, company_handle }, ...]
     * */

    static async findAll(customFilter) {

        // Similar to the companies filtering for the GET / route, add filtering for jobs for the following possible filters:
        // title: filter by job title. Like before, this should be a case-insensitive, matches-any-part-of-string search.
        // minSalary: filter to jobs with at least that salary.
        // hasEquity: if true, filter to jobs that provide a non-zero amount of equity. If false or not included in the filtering, list all jobs regardless of equity.

        // Creating 2 arrays to store the keys and values. Creating 1 variable to store the final WHERE Query.
        let arr_vals = [];
        let arr_query = [];
        let finalWhereQuery;

        // Creating a custom WHERE query if any of the customFilters were provided
        // customFilter is provided always but its empty. When filters are present, its not empty
        if (JSON.stringify(customFilter) !== '{}' && customFilter !== undefined) {
            // Iterating over the values and mapping them into an array
            // This will be used at the end of our WHERE SQL clause to prevent SQL injections
            Object.values(customFilter).map((val) => arr_vals.push(val));

            // Iterating over the keys of the customerFilter array that was passed to us
            // Grabbing the name of the key and the index for it
            Object.keys(customFilter).map((colName, idx) => {

                // if the key is called title
                if (colName === 'title') {
                    // WHERE title ILIKE %VALUE%
                    arr_query.push(`title ILIKE '%' || $${idx+1} || '%'`);

                    // if the key is called minSalary
                } else if (colName === 'minSalary') {
                    // minSalary >= $VALUE
                    arr_query.push(`"salary">=$${idx+1}`)

                    // if the key is called hasEquity
                } else if (colName === 'hasEquity') {
                    if(customFilter.hasEquity == 'true') {
                        // equity > 0
                    arr_query.push(`"equity">'0'`)
                    }
                    // deleting the 'true' value from the array so we don't pass it to SQL without the $3 sign.
                    // if we don't do this, it will cause a binding error in SQL
                    arr_vals.splice(idx,1);
                }
            });

            // Building the WHERE query by joining all the criteria with AND
            finalWhereQuery = `WHERE ${arr_query.join(' AND ')}`;
        }

        const jobsRes = await db.query(
            `SELECT id, title, salary, equity, company_handle
           FROM jobs
           ${finalWhereQuery}
           ORDER BY id`, arr_vals);

        return jobsRes.rows;
    }

    /** Given a job id, return data about company.
     *
     * Returns { id, title, salary, equity, company_handle }
     *
     * Throws NotFoundError if not found.
     **/

    static async get(id) {
        const jobRes = await db.query(
            `SELECT id, title, salary, equity, company_handle
           FROM jobs
           WHERE id = $1`,
            [id]);

        const job = jobRes.rows[0];

        if (!job) throw new NotFoundError(`No job: ${id}`);

        return job;
    }

    /** Update company data with `data`.
     *
     * This is a "partial update" --- it's fine if data doesn't contain all the
     * fields; this only changes provided ones.
     *
     * Data can include: { title, salary, equity }
     * Updating a job should never change the ID of a job, nor the company associated with a job.
     *
     * Returns { id, title, salary, equity, company_handle }
     *
     * Throws NotFoundError if not found.
     */

    static async update(id, data) {
        const {
            setCols,
            values
        } = sqlForPartialUpdate(
            data, {});
        const idVarIdx = "$" + (values.length + 1);

        const querySql = `UPDATE jobs 
                      SET ${setCols} 
                      WHERE id = ${idVarIdx} 
                      RETURNING id, title, salary, equity, company_handle`;
        const result = await db.query(querySql, [...values, id]);
        const job = result.rows[0];

        if (!job) throw new NotFoundError(`No job: ${id}`);

        return job;
    }

    /** Delete given company from database; returns undefined.
     *
     * Throws NotFoundError if company not found.
     **/

    static async remove(id) {
        const result = await db.query(
            `DELETE
           FROM jobs
           WHERE id = $1
           RETURNING id`,
            [id]);
        const job = result.rows[0];

        if (!job) throw new NotFoundError(`No job: ${id}`);
    }
}


module.exports = Job;