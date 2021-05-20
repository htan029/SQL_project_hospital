-- CS166 Project Phase 2
-- Heng Tan & Harris Shepard
DROP TABLE IF EXISTS hospital CASCADE;
DROP TABLE IF EXISTS patient CASCADE;
DROP TABLE IF EXISTS appointment CASCADE;

DROP TABLE IF EXISTS staff_works_in CASCADE;
DROP TABLE IF EXISTS department_includes CASCADE;
DROP TABLE IF EXISTS doctor_works_dept CASCADE;

DROP TABLE IF EXISTS past_appointment CASCADE;
DROP TABLE IF EXISTS active_appointment CASCADE;
DROP TABLE IF EXISTS available_appointment CASCADE;
DROP TABLE IF EXISTS waitlisted_appointment CASCADE;

DROP TABLE IF EXISTS has CASCADE;
DROP TABLE IF EXISTS schedules CASCADE;
DROP TABLE IF EXISTS search_appnt CASCADE;
DROP TABLE IF EXISTS request_maintenance CASCADE;

-- Hospital, Patient, Appointment
CREATE TABLE Hospital(
    hospital_ID VARCHAR(20) NOT NULL,
    hname VARCHAR(20),
    PRIMARY KEY (hospital_ID)
);

CREATE TABLE Patient(
    patient_ID VARCHAR(20) NOT NULL,
    pname VARCHAR(20),
    gender VARCHAR(20),
    age INTEGER,
    address VARCHAR(50),
    number_appointment INTEGER,
    PRIMARY KEY (patient_ID)
);

CREATE TABLE Appointment(
    appnt_ID VARCHAR(20) NOT NULL,
    date VARCHAR(20),
    time_slot VARCHAR(20),
    PRIMARY KEY (appnt_ID)
);

-- Staff, Department, Doctor
CREATE TABLE Staff_works_in(
    staff_ID VARCHAR(20) NOT NULL,
    sname VARCHAR(20),
    hospital_ID VARCHAR(20) NOT NULL,
    UNIQUE(staff_ID),
    PRIMARY KEY (staff_ID, hospital_ID),
    FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID)
    ON DELETE NO ACTION
);

CREATE TABLE Department_includes(
    dept_ID VARCHAR(20) NOT NULL,
    dpname VARCHAR(20),
    hospital_ID VARCHAR(20) NOT NULL,
    UNIQUE(dept_ID),
    PRIMARY KEY (dept_ID, hospital_ID),
    FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID)
    ON DELETE NO ACTION
);

CREATE TABLE Doctor_works_dept(
    doctor_ID VARCHAR(20) NOT NULL,
    dname VARCHAR(20),
    hospital_ID VARCHAR(20) NOT NULL,
    speciality VARCHAR(20),
    UNIQUE(doctor_ID),
    PRIMARY KEY (doctor_ID, hospital_ID),
    FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID)
    ON DELETE NO ACTION
);

-- past, active, available, waitlisted
CREATE TABLE past_appointment(
    appnt_ID VARCHAR(20) NOT NULL,
    PRIMARY KEY (appnt_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment
    ON DELETE CASCADE
);

CREATE TABLE active_appointment(
    appnt_ID VARCHAR(20) NOT NULL,
    PRIMARY KEY (appnt_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment
    ON DELETE CASCADE
);

CREATE TABLE available_appointment(
    appnt_ID VARCHAR(20) NOT NULL,
    PRIMARY KEY (appnt_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment
    ON DELETE CASCADE
);

CREATE TABLE waitlisted_appointment(
    appnt_ID VARCHAR(20) NOT NULL,
    PRIMARY KEY (appnt_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment
    ON DELETE CASCADE
);

-- has
CREATE TABLE has(
    doctor_ID VARCHAR(20) NOT NULL,
    appnt_ID VARCHAR(20) NOT NULL,
    PRIMARY KEY (doctor_ID, appnt_ID),
    FOREIGN KEY (doctor_ID) REFERENCES Doctor_works_dept(doctor_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment(appnt_ID)
);

-- schedules
CREATE TABLE schedules(
    staff_ID VARCHAR(20) NOT NULL,
    appnt_ID VARCHAR(20) NOT NULL,
    PRIMARY KEY (staff_ID, appnt_ID),
    FOREIGN KEY (staff_ID) REFERENCES Staff_works_in(staff_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment(appnt_ID)
);

-- search_appnt
CREATE TABLE search_appnt(
    hospital_ID VARCHAR(20),
    patient_ID VARCHAR(20),
    appnt_ID VARCHAR(20),
    PRIMARY KEY (hospital_ID, patient_ID, appnt_ID),
    FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID),
    FOREIGN KEY (patient_ID) REFERENCES Patient(patient_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment(appnt_ID)
);

-- request_maintenance
CREATE TABLE request_maintenance(
    patient_per_hour INTEGER,
    dept_name VARCHAR(20),
    time_slot VARCHAR(20),
    doctor_ID VARCHAR(20) NOT NULL,
    staff_ID VARCHAR(20) NOT NULL,
    PRIMARY KEY (doctor_ID, staff_ID),
    FOREIGN KEY (doctor_ID) REFERENCES Doctor_works_dept(doctor_ID),
    FOREIGN KEY (staff_ID) REFERENCES Staff_works_in(staff_ID)
);