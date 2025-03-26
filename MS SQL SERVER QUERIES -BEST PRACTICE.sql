create database practice
use practice

CREATE TABLE Doctor (
    doctor_id VARCHAR(6) PRIMARY KEY,
    dr_first_name VARCHAR(15),
    dr_middle_name VARCHAR(15),
    dr_last_name VARCHAR(15)
);

-- Insert sample data into Doctor table
INSERT INTO Doctor (doctor_id, dr_first_name, dr_middle_name, dr_last_name) VALUES
('DOC001', 'John', 'A.', 'Smith'),
('DOC002', 'Sarah', 'M.', 'Johnson'),
('DOC003', 'Michael', NULL, 'Williams'),
('DOC004', 'Emily', 'R.', 'Brown'),
('DOC005', 'David', 'K.', 'Jones'),
('DOC006', 'Jennifer', NULL, 'Garcia'),
('DOC007', 'Robert', 'T.', 'Miller'),
('DOC008', 'Lisa', 'P.', 'Davis'),
('DOC009', 'Thomas', 'E.', 'Rodriguez'),
('DOC010', 'Nancy', NULL, 'Martinez');

select * from Doctor


-- Create Patient table (parent table for Appointment)
CREATE TABLE Patient (
    patient_id VARCHAR(6) PRIMARY KEY,
    p_first_name VARCHAR(15),
    p_middle_name VARCHAR(15),
    p_last_name VARCHAR(15),
    address VARCHAR(20),
    city VARCHAR(15),
    contact_number VARCHAR(10),
    p_app INT
);

-- Insert sample data into Patient table
INSERT INTO Patient (patient_id, p_first_name, p_middle_name, p_last_name, address, city, contact_number, p_app) VALUES
('PAT001', 'James', 'B.', 'Wilson', '123 Main St', 'Boston', '6175550101', 3),
('PAT002', 'Mary', 'L.', 'Taylor', '456 Oak Ave', 'New York', '2125550202', 5),
('PAT003', 'William', NULL, 'Anderson', '789 Pine Rd', 'Chicago', '3125550303', 2),
('PAT004', 'Patricia', 'S.', 'Thomas', '321 Elm St', 'Houston', '7135550404', 1),
('PAT005', 'Richard', 'D.', 'Jackson', '654 Maple Dr', 'Phoenix', '6025550505', 4),
('PAT006', 'Jennifer', NULL, 'White', '987 Cedar Ln', 'Philadelphia', '2155550606', 3),
('PAT007', 'Charles', 'F.', 'Harris', '147 Birch Ct', 'San Antonio', '2105550707', 2),
('PAT008', 'Linda', 'G.', 'Martin', '258 Walnut Way', 'San Diego', '6195550808', 5),
('PAT009', 'Joseph', NULL, 'Thompson', '369 Spruce Pl', 'Dallas', '2145550909', 1),
('PAT010', 'Susan', 'H.', 'Robinson', '741 Aspen Blvd', 'San Jose', '4085551010', 4);



select* from Patient

-- Create Appointment table (references Doctor and Patient)
CREATE TABLE Appointment (
    app_number VARCHAR(6) PRIMARY KEY,
    app_date DATE,
    app_time VARCHAR(8),
    app_reason VARCHAR(20),
    doctor_id VARCHAR(6),
    patient_id VARCHAR(6),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id),
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id)
);

-- Insert sample data into Appointment table
INSERT INTO Appointment (app_number, app_date, app_time, app_reason, doctor_id, patient_id) VALUES
('APP001', '2023-01-10', '09:00 AM', 'Annual Checkup', 'DOC001', 'PAT001'),
('APP002', '2023-01-11', '10:30 AM', 'Flu Symptoms', 'DOC002', 'PAT002'),
('APP003', '2023-01-12', '02:15 PM', 'Back Pain', 'DOC003', 'PAT003'),
('APP004', '2023-01-13', '11:00 AM', 'Vaccination', 'DOC004', 'PAT004'),
('APP005', '2023-01-14', '03:45 PM', 'Allergy Consult', 'DOC005', 'PAT005'),
('APP006', '2023-01-15', '08:30 AM', 'Follow-up', 'DOC006', 'PAT006'),
('APP007', '2023-01-16', '01:00 PM', 'Skin Rash', 'DOC007', 'PAT007'),
('APP008', '2023-01-17', '04:30 PM', 'Blood Test', 'DOC008', 'PAT008'),
('APP009', '2023-01-18', '09:45 AM', 'Physical Exam', 'DOC009', 'PAT009'),
('APP010', '2023-01-19', '10:15 AM', 'Headache', 'DOC010', 'PAT010');

select* from Appointment

-- Create BIII table (references Appointment)
CREATE TABLE BIII (
    bil_number VARCHAR(6) PRIMARY KEY,
    bil_date DATE,
    bil_status VARCHAR(8),
    bil_amount DECIMAL(7, 2),
    app_number VARCHAR(6),
    FOREIGN KEY (app_number) REFERENCES Appointment(app_number)
);

-- Insert sample data into BIII table
INSERT INTO BIII (bil_number, bil_date, bil_status, bil_amount, app_number) VALUES
('BIL001', '2023-01-10', 'Paid', 150.00, 'APP001'),
('BIL002', '2023-01-11', 'Pending', 200.00, 'APP002'),
('BIL003', '2023-01-12', 'Paid', 175.50, 'APP003'),
('BIL004', '2023-01-13', 'Pending', 120.00, 'APP004'),
('BIL005', '2023-01-14', 'Paid', 90.75, 'APP005'),
('BIL006', '2023-01-15', 'Pending', 250.00, 'APP006'),
('BIL007', '2023-01-16', 'Paid', 180.25, 'APP007'),
('BIL008', '2023-01-17', 'Pending', 300.00, 'APP008'),
('BIL009', '2023-01-18', 'Paid', 150.00, 'APP009'),
('BIL010', '2023-01-19', 'Pending', 125.50, 'APP010');

select * from BIII

-- Create Payment table (references BIII)
CREATE TABLE Payments (
    payment_id VARCHAR(6) PRIMARY KEY,
    pay_date DATE,
    Pay_node VARCHAR(30),
    pay_amount DECIMAL(7, 2),
    bil_number VARCHAR(6),
    FOREIGN KEY (bil_number) REFERENCES BIII(bil_number)
);
-- Insert sample data into Payment table
INSERT INTO Payments (payment_id, pay_date, Pay_node, pay_amount, bil_number) VALUES
('PAY001', '2023-01-10', 'Creditcard', 150.00, 'BIL001'),
('PAY002', '2023-01-12', 'Cash', 175.50, 'BIL003'),
('PAY003', '2023-01-14', 'Insurance', 90.75, 'BIL005'),
('PAY004', '2023-01-16', 'Credit Card', 180.25, 'BIL007'),
('PAY005', '2023-01-18', 'Check', 150.00, 'BIL009'),
('PAY006', '2023-01-20', 'Credit Card', 100.00, 'BIL002'),
('PAY007', '2023-01-21', 'Cash', 120.00, 'BIL004'),
('PAY008', '2023-01-22', 'Insurance', 125.00, 'BIL006'),
('PAY009', '2023-01-23', 'Credit Card', 200.00, 'BIL008'),
('PAY010', '2023-01-24', 'Check', 125.50, 'BIL010');

select * from Payments

 --1.Find all patients who live in either 'Boston', 'New York', or 'Chicago'.

 select* from Patient
 where city in ('Boston', 'New York', 'Chicago')

 --2.List all doctors who are NOT assigned to any appointments (their doctor_id doesn't appear in the Appointment table)

SELECT D.doctor_id, 
CONCAT(D.dr_first_name, ' ', COALESCE(D.dr_middle_name, ''), ' ', D.dr_last_name) AS DoctorFullName
FROM Doctor D
LEFT JOIN Appointment A ON D.doctor_id = A.doctor_id
WHERE A.doctor_id IS NULL;


--3.Find all patients who don't have a middle name (where p_middle_name is NULL).
 select* from Patient where p_middle_name is null

 --4.Display all bills that have a status assigned (bil_status is not NULL).
 select * from BIII
 where bil_status is not null
 
--5.Show all appointments and replace NULL doctor_id with 'UNASSIGNED'.////
SELECT app_number, app_date, app_time, app_reason, 
COALESCE(doctor_id, 'UNASSIGNED') AS doctor_id, patient_id FROM Appointment;


--6.Find all payments made between January 12, 2023 and January 18, 2023.
select* from Payments
WHERE pay_date between '2023-01-12' and '2023-01-18';

--7.List all unique cities where patients live (without duplicates).

select distinct city from Patient

--8.Combine the list of all doctor last names with all patient last names into a single result.
select dr_last_name from Doctor
union
select p_last_name from Patient

---9. Find patients who have both appointments and bills (patient_id exists in both Patient and BIII tables via Appointment).

 SELECT DISTINCT P.*
FROM Patient P
INNER JOIN Appointment A ON P.patient_id = A.patient_id
INNER JOIN BIII B ON A.app_number = B.app_number;

 ---10.  List doctors who have no appointments (doctors that exist in Doctor table but not in Appointment table).///

 SELECT D.doctor_id, 
CONCAT(D.dr_first_name, ' ', COALESCE(D.dr_middle_name, ''), ' ', D.dr_last_name) AS DoctorFullName
FROM Doctor D
LEFT JOIN Appointment A ON D.doctor_id = A.doctor_id
WHERE A.app_number IS NULL;

 

 --1 Display all appointments with the full names of both the doctor and patient (combine first, middle, and last names).

 SELECT A.app_number,
 CONCAT(D.dr_first_name, ' ', COALESCE(D.dr_middle_name, ''), ' ', D.dr_last_name) AS DoctorFullName,
 CONCAT(P.p_first_name, ' ', COALESCE(P.p_middle_name, ''), ' ', P.p_last_name) AS PatientFullName,
 A.app_date, A.app_time,A.app_reason
FROM Appointment A
JOIN Doctor D ON A.doctor_id = D.doctor_id
JOIN Patient P ON A.patient_id = P.patient_id;

--2. List all bills with their corresponding payment details (if any), showing bil_number, bil_amount, payment_id, and pay_amount.

SELECT 
    B.bil_number,
    B.bil_amount,
    P.payment_id,
    P.pay_amount
FROM BIII B
LEFT JOIN Payments P ON B.bil_number = P.bil_number;

--3. Show all patients and their appointments (if any), including patients who haven't had any appointments.

SELECT P.patient_id,
CONCAT(P.p_first_name, ' ', COALESCE(P.p_middle_name, ''), ' ', P.p_last_name) AS PatientFullName,
A.app_number,A.app_date,A.app_time,A.app_reason
FROM Patient P
LEFT JOIN Appointment A ON P.patient_id = A.patient_id;

---4.  Find pairs of doctors who share the same last name (excluding pairs where doctor_id is the same).

SELECT D1.doctor_id AS Doctor1_ID,
CONCAT(D1.dr_first_name, ' ', COALESCE(D1.dr_middle_name, ''), ' ', D1.dr_last_name) AS Doctor1_Name,D2.doctor_id AS Doctor2_ID,
CONCAT(D2.dr_first_name, ' ', COALESCE(D2.dr_middle_name, ''), ' ', D2.dr_last_name) AS Doctor2_Name,D1.dr_last_name AS Shared_Last_Name
FROM Doctor D1
JOIN Doctor D2 
ON D1.dr_last_name = D2.dr_last_name 
AND D1.doctor_id <> D2.doctor_id
ORDER BY D1.dr_last_name, D1.doctor_id, D2.doctor_id;

--5. * Display the total amount paid by each patient (sum of all payments through their bills), along with patient names.

SELECT P.patient_id,
CONCAT(P.p_first_name, ' ', COALESCE(P.p_middle_name, ''), ' ', P.p_last_name) AS PatientFullName,
COALESCE(SUM(PY.pay_amount), 0) AS TotalAmountPaid
FROM Patient P
JOIN Appointment A ON P.patient_id = A.patient_id
JOIN BIII B ON A.app_number = B.app_number
LEFT JOIN Payments PY ON B.bil_number = PY.bil_number
GROUP BY P.patient_id, P.p_first_name, P.p_middle_name, P.p_last_name

--6. Find all doctors who have more than 3 appointments.

SELECT doctor_id, COUNT(*) AS AppointmentCount FROM Appointment GROUP BY doctor_id; --no doctors have more than 3 appoinments

--7.  List patients who have at least one bill with an amount greater than the average bill amount.

SELECT DISTINCT P.patient_id, 
CONCAT(P.p_first_name, ' ', COALESCE(P.p_middle_name, ''), ' ', P.p_last_name) AS PatientFullName
FROM Patient P
JOIN Appointment A ON P.patient_id = A.patient_id
JOIN BIII B ON A.app_number = B.app_number
WHERE B.bil_amount >(SELECT AVG(bil_amount) FROM BIII);

---8.  Display all bills that don't have any associated payments.

SELECT B.bil_number, B.bil_amount, P.payment_id, P.pay_amount
FROM BIII B
LEFT JOIN Payments P ON B.bil_number = P.bil_number;

---9.  Find all appointments for patients who live in cities where more than one patient resides.

SELECT A.app_number, A.app_date, A.app_time, A.app_reason, P.patient_id, 
CONCAT(P.p_first_name, ' ', COALESCE(P.p_middle_name, ''), ' ', P.p_last_name) AS PatientFullName, P.city
FROM Appointment A
JOIN Patient P ON A.patient_id = P.patient_id
WHERE P.city IN (SELECT city FROM Patient GROUP BY city HAVING COUNT(patient_id) > 1);

--10. Show the doctor(s) with the highest number of appointments.3

SELECT TOP 1 WITH TIES doctor_id, COUNT(app_number) AS TotalAppointments
FROM Appointment
GROUP BY doctor_id












