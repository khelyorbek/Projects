## **Jobly**
## All the jobs in one, convenient place.

---
## How to run the application?
### Method 1: Running the application online
[**CLICK HERE TO OPEN THE APPLICATION ONLINE**]()

### Method 2: Running the application locally
1. Download this repository to your local computer
2. Make sure you have `npm` installed or check [this page](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm) on how install it
3. Make sure you have `psql` (PostgreSQL) installed or check [this page](https://www.postgresql.org/download/) on how to install it
4. Open command prompt on your computer
5. Navigate to the folder where you have this repository
6. Install dependencies by running `npm install`. (Note: this might take a while)
7. Load the sample data into a PostreSQL database
    1. Start your PostgreSQL server by typing `sudo service postgresql start`
    2. Type `psql` to open PostgreSQL
    3. Run the sql file by typing `\i backend/jobly.sql`
    4. Wait for the import to complete and accept any message that come up
    5. Exit psql by typing `\q`
    6. Open the backend folder
    7. Open the file called config.js
    8. Replace this string with your PostgreSQL configuration `postgresql://test:test@localhost/jobly`
    9. The format above is `postgresql://username:password@localhost/databasename`
8. Go back to the root of the repository folder
9. Run the application by typing `npm start`
10. Open `https://localhost:3000` in any browser (I recommend Chrome)

## Screenshots of the application
![sds](/frontend/screenshots/1.png)

