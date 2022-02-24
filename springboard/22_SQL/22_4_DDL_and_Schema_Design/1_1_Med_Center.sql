DROP DATABASE IF EXISTS med_center;

CREATE DATABASE med_center;

\c med_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender TEXT NOT NULL,
    office_location TEXT
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    gender TEXT
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors(id) ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients(id) ON DELETE CASCADE,
    visit_date DATE,
    room_num INTEGER
);

CREATE TABLE patient_diseases (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(id) ON DELETE CASCADE,
    disease_name TEXT,
    id_of_diagnosis_visit INTEGER REFERENCES visits(id) ON DELETE CASCADE,
    diagnosing_doctor_id INTEGER REFERENCES doctors(id) ON DELETE SET NULL
);

-- Adding some doctors into the doctors table
INSERT INTO doctors (first_name, last_name, gender, office_location)
VALUES
('Gregory', 'House', 'Male', 'Mercy Hospital'),
('Shaun', 'Murphy', 'Male', 'St Bonaventure'),
('Karen', 'Davis', 'Female', 'Passavant Hospital'),
('Georgeann', 'Smith', 'Female', 'Presbyterian Hospital');

    -- med_center=# SELECT * FROM doctors;
    --  id | first_name | last_name | gender |    office_location
    -- ----+------------+-----------+--------+-----------------------
    --   1 | Gregory    | House     | Male   | Mercy Hospital
    --   2 | Shaun      | Murphy    | Male   | St Bonaventure
    --   3 | Karen      | Davis     | Female | Passavant Hospital
    --   4 | Georgeann  | Smith     | Female | Presbyterian Hospital
    -- (4 rows)

INSERT INTO patients (first_name, last_name, gender)
VALUES
('Steve','Vai','Male'),
('Christone','Ingram','Male'),
('Avril','Lavigne','Female'),
('Kelly','Clarkson','Female');

    -- med_center=# SELECT * FROM patients;
    --  id | first_name | last_name | gender
    -- ----+------------+-----------+--------
    --   1 | Steve      | Vai       | Male
    --   2 | Christone  | Ingram    | Male
    --   3 | Avril      | Lavigne   | Female
    --   4 | Kelly      | Clarkson  | Female
    -- (4 rows)

INSERT INTO visits (doctor_id, patient_id, visit_date, room_num)
VALUES
('1','1','2021-12-31','2'),
('1','2','2021-01-02','3'),
('2','3','2021-01-03','11'),
('2','4','2021-02-20','4'),
('3','4','2021-03-05','7'),
('3','3','2021-05-27','5'),
('4','2','2021-07-17','1'),
('4','1','2021-06-18','6');

    -- med_center=# SELECT * FROM visits;
    --  id | doctor_id | patient_id | visit_date | room_num
    -- ----+-----------+------------+------------+----------
    --   1 |         1 |          1 | 2021-12-31 |        2
    --   2 |         1 |          2 | 2021-01-02 |        3
    --   3 |         2 |          3 | 2021-01-03 |       11
    --   4 |         2 |          4 | 2021-02-20 |        4
    --   5 |         3 |          4 | 2021-03-05 |        7
    --   6 |         3 |          3 | 2021-05-27 |        5
    --   7 |         4 |          2 | 2021-07-17 |        1
    --   8 |         4 |          1 | 2021-06-18 |        6
    -- (8 rows)

INSERT INTO patient_diseases (patient_id, disease_name, id_of_diagnosis_visit, diagnosing_doctor_id)
VALUES
('1','Diabetes','8','4'),
('2','High Blood Pressure','2','1'),
('2','Migraine','7','4'),
('3','Twisted Ankle','6','3'),
('4','Anemia','4','2');

    -- med_center=# SELECT * FROM patient_diseases;
    --  id | patient_id |    disease_name     | id_of_diagnosis_visit | diagnosing_doctor_id
    -- ----+------------+---------------------+-----------------------+----------------------
    --   1 |          1 | Diabetes            |                     8 |                    4
    --   2 |          2 | High Blood Pressure |                     2 |                    1
    --   3 |          2 | Migraine            |                     7 |                    4
    --   4 |          3 | Twisted Ankle       |                     6 |                    3
    --   5 |          4 | Anemia              |                     4 |                    2
    -- (5 rows)

