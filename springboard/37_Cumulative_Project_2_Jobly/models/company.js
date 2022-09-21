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

/** Related functions for companies. */

class Company {
  /** Create a company (from data), update db, return new company data.
   *
   * data should be { handle, name, description, numEmployees, logoUrl }
   *
   * Returns { handle, name, description, numEmployees, logoUrl }
   *
   * Throws BadRequestError if company already in database.
   * */

  static async create({
    handle,
    name,
    description,
    numEmployees,
    logoUrl
  }) {
    const duplicateCheck = await db.query(
      `SELECT handle
           FROM companies
           WHERE handle = $1`,
      [handle]);

    if (duplicateCheck.rows[0])
      throw new BadRequestError(`Duplicate company: ${handle}`);

    const result = await db.query(
      `INSERT INTO companies
           (handle, name, description, num_employees, logo_url)
           VALUES ($1, $2, $3, $4, $5)
           RETURNING handle, name, description, num_employees AS "numEmployees", logo_url AS "logoUrl"`,
      [
        handle,
        name,
        description,
        numEmployees,
        logoUrl,
      ],
    );
    const company = result.rows[0];

    return company;
  }

  /** Find all companies.
   *
   * Returns [{ handle, name, description, numEmployees, logoUrl }, ...]
   * */

  static async findAll(customFilter) {

    // Add a new feature to this, allowing API users to filter the results based on optional filtering criteria, any or all of which can be passed in the query string:

    // Creating 2 arrays to store the keys and values. Creating 1 variable to store the final WHERE Query.
    let arr_vals = [];
    let arr_query = [];
    let finalWhereQuery;
    // console.log("-=-=CUSTOMFILTER: ", customFilter);

    // Creating a custom WHERE query if any of the customFilters were provided
    // customFilter is provided always but its empty. When filters are presents, its not empty
    if (JSON.stringify(customFilter) !== '{}' && customFilter !== undefined) {
      // If the minEmployees parameter is greater than the maxEmployees parameter, respond with a 400 error with an appropriate message.
      if (customFilter.hasOwnProperty('minEmployees') && customFilter.hasOwnProperty('maxEmployees')) {
          if (customFilter.minEmployees > customFilter.maxEmployees) {
            throw new BadRequestError(`Minimum amount of employees cannot be greated than maximum amount of employees!`);
          }
        }
      



      // Iterating over the values and mapping them into an array
      // This will be used at the end of our WHERE SQL clause to prevent SQL injections
      Object.values(customFilter).map((val) => arr_vals.push(val));

      // Iterating over the keys of the customerFilter array that was passed to us
      // Grabbing the name of the key and the index for it
      Object.keys(customFilter).map((colName, idx) => {
        // if the key is called name
        if (colName === 'name') {
          // WHERE name ILIKE %VALUE%
          arr_query.push(`name ILIKE '%' || $${idx+1} || '%'`);
          // if the key is called minEmployees
        } else if (colName === 'minEmployees') {
          // num_employees >= $VALUE
          arr_query.push(`"num_employees">=$${idx+1}`)
          // if the key is called maxEmployees
        } else if (colName === 'maxEmployees') {
          // num_employees <= $VALUE
          arr_query.push(`"num_employees"<=$${idx+1}`)
        }
      });

      // console.log("-Keys: ", arr_keys);
      // console.log("-Indexes: ", arr_idxs);
      // console.log("-Values: ", arr_vals);
      // console.log("--TEST: ", arr_test);
      // console.log("--JOINED: ", arr_test.join(' AND '));
      // console.log("--QUERY: ", arr_query.join(' AND '));

      // Building the WHERE query by joining all the criteria with AND
      finalWhereQuery = `WHERE ${arr_query.join(' AND ')}`;

      // console.log("-FINAL WHERE QUERY: ", finalWhereQuery);
      // console.log("-FINAL WHERE VALUES: ", finalWhereValues);
    }

    // console.log("-FINAL WHERE QUERY: ", finalWhereQuery);
    const companiesRes = await db.query(
      `SELECT handle,
                  name,
                  description,
                  num_employees AS "numEmployees",
                  logo_url AS "logoUrl"
           FROM companies
           ${finalWhereQuery}
           ORDER BY name`, arr_vals);

    return companiesRes.rows;
  }

  /** Given a company handle, return data about company.
   *
   * Returns { handle, name, description, numEmployees, logoUrl, jobs }
   *   where jobs is [{ id, title, salary, equity, companyHandle }, ...]
   *
   * Throws NotFoundError if not found.
   **/

  static async get(handle) {
    const companyRes = await db.query(
      `SELECT handle,
                  name,
                  description,
                  num_employees AS "numEmployees",
                  logo_url AS "logoUrl"
           FROM companies
           WHERE handle = $1`,
      [handle]);

    const company = companyRes.rows[0];

    if (!company) throw new NotFoundError(`No company: ${handle}`);

    // Now that the app includes jobs, change the GET /companies/:handle feature so that it includes all of the information about the jobs associated with that company:
    // Querying the database and getting all the jobs that match the company handle
    const jobsRes = await db.query(
      `SELECT *
      FROM jobs
      WHERE company_handle= $1`,
      [handle]
    );

    // Mapping the result of the query into a variable
    let jobs = jobsRes.rows[0];

    // If there are no results, the jobs variable will be replaced by a message.
    if (!jobs) {jobs = {message: `No jobs available for this company.`}};

    company.jobs = jobs;

    return company;
  }

  /** Update company data with `data`.
   *
   * This is a "partial update" --- it's fine if data doesn't contain all the
   * fields; this only changes provided ones.
   *
   * Data can include: {name, description, numEmployees, logoUrl}
   *
   * Returns {handle, name, description, numEmployees, logoUrl}
   *
   * Throws NotFoundError if not found.
   */

  static async update(handle, data) {
    const {
      setCols,
      values
    } = sqlForPartialUpdate(
      data, {
        numEmployees: "num_employees",
        logoUrl: "logo_url",
      });
    const handleVarIdx = "$" + (values.length + 1);

    const querySql = `UPDATE companies 
                      SET ${setCols} 
                      WHERE handle = ${handleVarIdx} 
                      RETURNING handle, 
                                name, 
                                description, 
                                num_employees AS "numEmployees", 
                                logo_url AS "logoUrl"`;
    const result = await db.query(querySql, [...values, handle]);
    const company = result.rows[0];

    if (!company) throw new NotFoundError(`No company: ${handle}`);

    return company;
  }

  /** Delete given company from database; returns undefined.
   *
   * Throws NotFoundError if company not found.
   **/

  static async remove(handle) {
    const result = await db.query(
      `DELETE
           FROM companies
           WHERE handle = $1
           RETURNING handle`,
      [handle]);
    const company = result.rows[0];

    if (!company) throw new NotFoundError(`No company: ${handle}`);
  }
}


module.exports = Company;