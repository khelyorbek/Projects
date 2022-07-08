/** Database setup for BizTime. */

const { Client } = require("pg");

let db = new Client({
  connectionString: "postgresql://test:test@localhost/biztime"
});

db.connect();

module.exports = db;

/* 
biztime=# SELECT * FROM companies;
 code  |      name      |  description
-------+----------------+---------------
 apple | Apple Computer | Maker of OSX.
 ibm   | IBM            | Big blue.
(2 rows)

              Table "public.companies"
   Column    | Type | Collation | Nullable | Default
-------------+------+-----------+----------+---------
 code        | text |           | not null |
 name        | text |           | not null |
 description | text |           |          |
Indexes:
    "companies_pkey" PRIMARY KEY, btree (code)
    "companies_name_key" UNIQUE CONSTRAINT, btree (name)
Referenced by:
    TABLE "invoices" CONSTRAINT "invoices_comp_code_fkey" FOREIGN KEY (comp_code) REFERENCES companies(code) ON DELETE CASCADE

****************************************************************************************************************************************

biztime=# SELECT * FROM invoices;
 id | comp_code | amt | paid |  add_date  | paid_date
----+-----------+-----+------+------------+------------
  1 | apple     | 100 | f    | 2022-06-29 |
  2 | apple     | 200 | f    | 2022-06-29 |
  3 | apple     | 300 | t    | 2022-06-29 | 2018-01-01
  4 | ibm       | 400 | f    | 2022-06-29 |
(4 rows)

 Table "public.invoices"
  Column   |       Type       | Collation | Nullable |               Default
-----------+------------------+-----------+----------+--------------------------------------
 id        | integer          |           | not null | nextval('invoices_id_seq'::regclass)
 comp_code | text             |           | not null |
 amt       | double precision |           | not null |
 paid      | boolean          |           | not null | false
 add_date  | date             |           | not null | CURRENT_DATE
 paid_date | date             |           |          |
Indexes:
    "invoices_pkey" PRIMARY KEY, btree (id)
Check constraints:
    "invoices_amt_check" CHECK (amt > 0::double precision)
Foreign-key constraints:
    "invoices_comp_code_fkey" FOREIGN KEY (comp_code) REFERENCES companies(code) ON DELETE CASCADE

*/