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
    hospital_ID INTEGER NOT NULL,
    hname CHAR(20),
    PRIMARY KEY (hospital_ID)
);

CREATE TABLE Patient(
    patient_ID INTEGER NOT NULL,
    pname CHAR(20),
    gender CHAR(20),
    age INTEGER,
    address CHAR(50),
    number_appointment INTEGER,
    PRIMARY KEY (patient_ID)
);

CREATE TABLE Appointment(
    appnt_ID INTEGER NOT NULL,
    date CHAR(20),
    time_slot CHAR(20),
    PRIMARY KEY (appnt_ID)
);

-- Staff, Department, Doctor
CREATE TABLE Staff_works_in(
    staff_ID INTEGER NOT NULL,
    sname CHAR(20),
    hospital_ID INTEGER NOT NULL,
    UNIQUE(staff_ID),
    PRIMARY KEY (staff_ID, hospital_ID),
    FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID)
);

CREATE TABLE Department_includes(
    dept_ID INTEGER NOT NULL,
    dpname CHAR(20),
    hospital_ID INTEGER NOT NULL,
    UNIQUE(dept_ID),
    PRIMARY KEY (dept_ID, hospital_ID),
    FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID)
);

CREATE TABLE Doctor_works_dept(
    doctor_ID INTEGER NOT NULL,
    dname CHAR(20),
    hospital_ID INTEGER NOT NULL,
    UNIQUE(doctor_ID),
    PRIMARY KEY (doctor_ID, hospital_ID),
    FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID)
);

-- past, active, available, waitlisted
CREATE TABLE past_appointment(
    appnt_ID INTEGER NOT NULL,
    PRIMARY KEY (appnt_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment
);

CREATE TABLE active_appointment(
    appnt_ID INTEGER NOT NULL,
    PRIMARY KEY (appnt_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment
);

CREATE TABLE available_appointment(
    appnt_ID INTEGER NOT NULL,
    PRIMARY KEY (appnt_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment
);

CREATE TABLE waitlisted_appointment(
    appnt_ID INTEGER NOT NULL,
    PRIMARY KEY (appnt_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment
);

-- has
CREATE TABLE has(
    doctor_ID INTEGER NOT NULL,
    appnt_ID INTEGER NOT NULL,
    PRIMARY KEY (doctor_ID, appnt_ID),
    FOREIGN KEY (doctor_ID) REFERENCES Doctor_works_dept(doctor_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment(appnt_ID)
);

-- schedules
CREATE TABLE schedules(
    staff_ID INTEGER NOT NULL,
    appnt_ID INTEGER NOT NULL,
    PRIMARY KEY (staff_ID, appnt_ID),
    FOREIGN KEY (staff_ID) REFERENCES Staff_works_in(staff_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment(appnt_ID)
);

-- search_appnt
CREATE TABLE search_appnt(
    hospital_ID INTEGER,
    patient_ID INTEGER,
    appnt_ID INTEGER,
    PRIMARY KEY (hospital_ID, patient_ID, appnt_ID),
    FOREIGN KEY (hospital_ID) REFERENCES Hospital(hospital_ID),
    FOREIGN KEY (patient_ID) REFERENCES Patient(patient_ID),
    FOREIGN KEY (appnt_ID) REFERENCES Appointment(appnt_ID)
);

-- request_maintenance
CREATE TABLE request_maintenance(
    patient_per_hour INTEGER,
    dept_name CHAR(20),
    time_slot CHAR(20),
    doctor_ID INTEGER NOT NULL,
    staff_ID INTEGER NOT NULL,
    PRIMARY KEY (doctor_ID, staff_ID),
    FOREIGN KEY (doctor_ID) REFERENCES Doctor_works_dept(doctor_ID),
    FOREIGN KEY (staff_ID) REFERENCES Staff_works_in(staff_ID)
);