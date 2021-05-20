COPY Hospital (
	hospital_ID,
	hname)
FROM 'hospital.txt'
WITH DELIMITER ',';

COPY Department_includes (
	dept_ID,
	hospital_ID,
	dpname)
FROM 'dept.txt'
WITH DELIMITER ',';

COPY Doctor_works_dept (
	doctor_ID,
	hospital_ID,
	dname,
	speciality)
FROM 'doc.txt'
WITH DELIMITER ',';

COPY Patient (
	patient_ID,
	pname,
	gender,
	age,
	address,
	number_appointment)
FROM 'patient.txt'
WITH DELIMITER ';';

COPY Appointment (
	appnt_ID,
	date,
	time_slot)
FROM 'appt.txt'
WITH DELIMITER ',';

COPY Staff_works_in (
	staff_ID,
	hospital_ID,
	sname)
FROM 'staff.txt'
WITH DELIMITER ',';

COPY past_appointment (
	appnt_ID)
FROM 'past_appt.txt';


COPY waitlisted_appointment (
	appnt_ID)
FROM 'waitlisted_appt.txt';


COPY active_appointment (
	appnt_ID)
FROM 'active_appt.txt';

COPY available_appointment (
	appnt_ID)
FROM 'avail_appt.txt';

COPY has (
	appnt_ID,
	doctor_ID)
FROM 'has.txt'
WITH DELIMITER ',';

COPY schedules(
	appnt_ID,
	staff_ID)
FROM 'schedule.txt'
WITH DELIMITER ',';

COPY request_maintenance (
	staff_ID,
	doctor_ID,
	patient_per_hour,
	dept_name,
	time_slot)
FROM 'request.txt'
WITH DELIMITER ',';


COPY search_appnt (
	appnt_ID,
	hospital_ID,
	patient_ID)
FROM 'searches.txt'
WITH DELIMITER ',';


