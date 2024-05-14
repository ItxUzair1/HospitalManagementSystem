create database if not exists HMS;


create table Room (
Room_id int primary key
, Room_Number int
, Room_Cost int
);

create table Department (
Department_id int primary key,
Department_name varchar(100),
Department_Head varchar(100),
Emp_Count int
);

create table Patient (
Patient_id int primary key,
Patient_Fname varchar(100) not null,
Patient_Lname varchar(100) not null,
Blood_Type varchar(20),
Gender varchar(50),
Phone  varchar(100) not null,
Admission_Date date,
Discharge_Date date,
DOB date,
Room_id int,
constraint FK_ROOMID FOREIGN key(Room_id) references Room(Room_id) 
on delete cascade on update cascade
);


create table Bill (
Bill_id int primary key,
Room_Cost int,
Test_Cost int,
M_Cost int,
Other_Charges int,
Total int,
Remaining_Balance int,
Bill_Date date,
Bill_Time time,
patient_id int,
constraint FK_PatientID FOREIGN key(Patient_id) references Patient(Patient_id) 
on delete cascade on update cascade
);

create table StaffRecord (
Emp_id int primary key,
First_name varchar(100) not null,
Last_name varchar(100) not null,
Date_Joining date,
Date_Separation date,
Address varchar(100),
Email varchar(100),
Type varchar(100));


create Table MedicalRecord (
Record_id int primary key,
PreCondition varchar(100),
Patient_id int,
constraint FK_RPatientID FOREIGN key(Patient_id) references Patient(Patient_id));


create table Doctor (
Doctor_id int primary key,
Address varchar(100),
Specialization varchar(100),
Gender varchar(100),
Phone varchar(100),
Emp_id int,
Department_id int,
constraint FK_DepartmentID FOREIGN key(Department_id) references Department(Department_id) 
on delete cascade on update cascade,
constraint FK_EmpID FOREIGN key(Emp_id) references StaffRecord(Emp_id) 
on delete cascade on update cascade
);

create table Appointment (
Appointment_id int primary key,
Scheduled_Time time,
A_Date date,
Patient_id int,
Doctor_id int,
constraint FK_APatientID FOREIGN key(Patient_id) references Patient(Patient_id) 
on delete cascade on update cascade,
constraint FK_Doctor_ID FOREIGN key(Doctor_id) references Doctor(Doctor_id) 
on delete cascade on update cascade
);


create table Prescription (
Prescription_id int primary key,
Dosage int,
Date date,
Patient_id int,
Doctor_id int,
constraint FK_PPatientID FOREIGN key(Patient_id) references Patient(Patient_id) 
on delete cascade on update cascade,
constraint FK_PDoctor_ID FOREIGN key(Doctor_id) references Doctor(Doctor_id) );

create table Nurse (
Nurse_id int primary key,
N_Name varchar(100),
Gender varchar(100),
Address varchar(100),
Emp_id int,
Department_id int,
constraint FK_NDepartmentID FOREIGN key(Department_id) references Department(Department_id) 
on delete cascade on update cascade,
constraint FK_NEmpID FOREIGN key(Emp_id) references StaffRecord(Emp_id) 
on delete cascade on update cascade
);

create table Medicine (
Medicine_id int primary key,
Medicine_name varchar(100),
Quantity int,
M_Cost int);

create table Assignements (
Assignment_id int primary key,
A_Status varchar(100),
A_Type varchar(100),
Patient_id int,
Nurse_id int,
constraint FK_ASPatientID FOREIGN key(Patient_id) references Patient(Patient_id) 
on delete cascade on update cascade,
constraint FK_NurseID FOREIGN key(Nurse_id) references Nurse(Nurse_id) 
on delete cascade on update cascade);


create table Prescription_Medicines (
PM_id int primary key,
M_Quantity int,
Medicine_id int,
Prescription_id int,
constraint FK_MedicineID FOREIGN key(Medicine_id) references Medicine(Medicine_id) 
on delete cascade on update cascade,
constraint FK_PrescriptionID FOREIGN key(Prescription_id) references Prescription(Prescription_id) 
on delete cascade on update cascade
);

-- Insert data into Room table
INSERT INTO Room (Room_id, Room_Number, Room_Cost) VALUES
(1, 101, 100),
(2, 102, 120),
(3, 103, 110),
(4, 104, 130),
(5, 105, 125),
(6, 106, 115),
(7, 107, 105),
(8, 108, 135),
(9, 109, 140),
(10, 110, 150);

-- Insert data into Department table
INSERT INTO Department (Department_id, Department_name, Department_Head, Emp_Count) VALUES
(1, 'Cardiology', 'Dr. Smith', 15),
(2, 'Orthopedics', 'Dr. Johnson', 12),
(3, 'Neurology', 'Dr. Williams', 10),
(4, 'Oncology', 'Dr. Brown', 8),
(5, 'Pediatrics', 'Dr. Wilson', 20),
(6, 'Gynecology', 'Dr. Martinez', 18),
(7, 'Dermatology', 'Dr. Taylor', 14),
(8, 'ENT', 'Dr. Anderson', 11),
(9, 'Urology', 'Dr. Thomas', 9),
(10, 'Psychiatry', 'Dr. Garcia', 16);

-- Insert data into Patient table
INSERT INTO Patient (Patient_id, Patient_Fname, Patient_Lname, Blood_Type, Gender, Phone, Admission_Date, Discharge_Date, DOB, Room_id) VALUES
(1, 'John', 'Doe', 'O+', 'Male', '123-456-7890', '2024-04-01', '2024-04-10', '1990-05-15', 1),
(2, 'Jane', 'Smith', 'A-', 'Female', '234-567-8901', '2024-04-03', '2024-04-12', '1985-08-20', 2),
(3, 'Michael', 'Johnson', 'B+', 'Male', '345-678-9012', '2024-04-05', '2024-04-15', '1978-12-10', 3),
(4, 'Emily', 'Williams', 'AB-', 'Female', '456-789-0123', '2024-04-07', '2024-04-20', '1995-03-25', 4),
(5, 'David', 'Brown', 'O-', 'Male', '567-890-1234', '2024-04-09', '2024-04-22', '1980-11-30', 5),
(6, 'Olivia', 'Wilson', 'A+', 'Female', '678-901-2345', '2024-04-11', '2024-04-25', '1992-07-05', 6),
(7, 'William', 'Martinez', 'B-', 'Male', '789-012-3456', '2024-04-13', '2024-04-28', '1987-09-12', 7),
(8, 'Sophia', 'Taylor', 'AB+', 'Female', '890-123-4567', '2024-04-15', '2024-04-30', '1983-04-18', 8),
(9, 'James', 'Anderson', 'O+', 'Male', '901-234-5678', '2024-04-17', '2024-05-01', '1976-01-08', 9),
(10, 'Emma', 'Thomas', 'A-', 'Female', '012-345-6789', '2024-04-19', '2024-05-03', '1998-10-22', 10);

-- Insert data into Bill table
INSERT INTO Bill (Bill_id, Room_Cost, Test_Cost, M_Cost, Other_Charges, Total, Remaining_Balance, Bill_Date, Bill_Time, patient_id) VALUES
(1, 100, 50, 30, 20, 200, 0, '2024-04-10', '10:00:00', 1),
(2, 120, 60, 40, 25, 245, 0, '2024-04-12', '11:30:00', 2),
(3, 110, 55, 35, 22, 222, 0, '2024-04-15', '09:45:00', 3),
(4, 130, 65, 45, 28, 268, 0, '2024-04-20', '12:15:00', 4),
(5, 125, 62, 42, 26, 255, 0, '2024-04-22', '14:30:00', 5),
(6, 115, 57, 37, 23, 232, 0, '2024-04-25', '16:45:00', 6),
(7, 105, 52, 32, 21, 210, 0, '2024-04-28', '18:00:00', 7),
(8, 135, 67, 47, 29, 285, 0, '2024-04-30', '20:15:00', 8),
(9, 140, 70, 50, 31, 291, 0, '2024-05-01', '22:30:00', 9),
(10, 150, 75, 55, 35, 315, 0, '2024-05-03', '09:00:00', 10);

-- Insert data into StaffRecord table
INSERT INTO StaffRecord (Emp_id, First_name, Last_name, Date_Joining, Date_Separation, Address, Email, Type) VALUES
(1, 'Adam', 'Johnson', '2018-01-15', NULL, '123 Main St', 'adam.johnson@example.com', 'Doctor'),
(2, 'Sarah', 'Williams', '2019-03-20', NULL, '456 Elm St', 'sarah.williams@example.com', 'Nurse'),
(3, 'Christopher', 'Brown', '2020-05-10', NULL, '789 Oak St', 'christopher.brown@example.com', 'Doctor'),
(4, 'Jessica', 'Wilson', '2021-07-05', NULL, '101 Pine St', 'jessica.wilson@example.com', 'Nurse'),
(5, 'Michael', 'Martinez', '2022-09-12', NULL, '202 Maple St', 'michael.martinez@example.com', 'Doctor'),
(6, 'Elizabeth', 'Taylor', '2023-11-18', NULL, '303 Cedar St', 'elizabeth.taylor@example.com', 'Nurse'),
(7, 'Andrew', 'Anderson', '2017-04-08', NULL, '404 Spruce St', 'andrew.anderson@example.com', 'Doctor'),
(8, 'Rachel', 'Thomas', '2016-02-22', NULL, '505 Birch St', 'rachel.thomas@example.com', 'Nurse'),
(9, 'Kevin', 'Garcia', '2015-08-30', NULL, '606 Walnut St', 'kevin.garcia@example.com', 'Doctor'),
(10, 'Lauren', 'Clark', '2014-06-25', NULL, '707 Pineapple St', 'lauren.clark@example.com', 'Nurse');

-- Insert data into MedicalRecord table
INSERT INTO MedicalRecord (Record_id, PreCondition, Patient_id) VALUES
(1, 'Hypertension', 1),
(2, 'Fractured leg', 2),
(3, 'Migraine', 3),
(4, 'Cancer', 4),
(5, 'Diabetes', 5),
(6, 'Pregnancy', 6),
(7, 'Eczema', 7),
(8, 'Ear infection', 8),
(9, 'Kidney stones', 9),
(10, 'Depression', 10);

-- Insert data into Doctor table
INSERT INTO Doctor (Doctor_id, Address, Specialization, Gender, Phone, Emp_id,Department_id) VALUES
(1, '123 Main St', 'Cardiologist', 'Male', '123-456-7890', 1,1),
(2, '456 Elm St', 'Orthopedist', 'Female', '234-567-8901', 3,3),
(3, '789 Oak St', 'Neurologist', 'Male', '345-678-9012', 5,4),
(4, '101 Pine St', 'Oncologist', 'Female', '456-789-0123', 7,2),
(5, '202 Maple St', 'Pediatrician', 'Male', '567-890-1234', 9,5);


-- Insert data into Appointment table
INSERT INTO Appointment (Appointment_id, Scheduled_Time, A_Date, Patient_id, Doctor_id) VALUES
(1, '10:00:00', '2024-04-10', 1, 1),
(2, '11:30:00', '2024-04-12', 2, 2),
(3, '09:45:00', '2024-04-15', 3, 3),
(4, '12:15:00', '2024-04-20', 4, 4),
(5, '14:30:00', '2024-04-22', 5, 5),
(6, '16:45:00', '2024-04-25', 6, 2),
(7, '18:00:00', '2024-04-28', 7, 1),
(8, '20:15:00', '2024-04-30', 8, 4),
(9, '22:30:00', '2024-05-01', 9, 5),
(10, '09:00:00', '2024-05-03', 10, 3);

-- Insert data into Prescription table
INSERT INTO Prescription (Prescription_id, Dosage, Date, Patient_id, Doctor_id) VALUES
(1, 100, '2024-04-10', 1, 1),
(2, 120, '2024-04-12', 2, 2),
(3, 110, '2024-04-15', 3, 3),
(4, 130, '2024-04-20', 4, 4),
(5, 125, '2024-04-22', 5, 5),
(6, 115, '2024-04-25', 6, 3),
(7, 105, '2024-04-28', 7, 1),
(8, 135, '2024-04-30', 8, 2),
(9, 140, '2024-05-01', 9, 4),
(10, 150, '2024-05-03', 10, 3);

-- Insert data into Nurse table
INSERT INTO Nurse (Nurse_id, N_Name, Gender, Address, Emp_id,Department_id) VALUES
(1, 'Mary', 'Female', '123 Main St', 2,6),
(2, 'John', 'Male', '456 Elm St', 4,9),
(3, 'Jessica', 'Female', '789 Oak St', 6,7),
(4, 'David', 'Male', '101 Pine St', 8,5),
(5, 'Jennifer', 'Female', '202 Maple St', 10,2);


-- Insert data into Medicine table
INSERT INTO Medicine (Medicine_id, Medicine_name, Quantity, M_Cost) VALUES
(1, 'Paracetamol', 100, 10),
(2, 'Amoxicillin', 50, 15),
(3, 'Aspirin', 75, 12),
(4, 'Ibuprofen', 80, 14),
(5, 'Lisinopril', 40, 20),
(6, 'Simvastatin', 30, 18),
(7, 'Metformin', 60, 25),
(8, 'Atorvastatin', 35, 22),
(9, 'Levothyroxine', 45, 16),
(10, 'Losartan', 55, 19);

-- Insert data into Assignements table
INSERT INTO Assignements (Assignment_id, A_Status, A_Type, Patient_id, Nurse_id) VALUES
(1, 'Active', 'Regular', 1, 1),
(2, 'Active', 'Regular', 2, 2),
(3, 'Active', 'Regular', 3, 3),
(4, 'Active', 'Regular', 4, 4),
(5, 'Active', 'Regular', 5, 5),
(6, 'Active', 'Regular', 6, 4),
(7, 'Active', 'Regular', 7, 2),
(8, 'Active', 'Regular', 8, 1),
(9, 'Active', 'Regular', 9, 3),
(10, 'Active', 'Regular', 10, 5);

-- Insert data into Prescription_Medicines table
INSERT INTO Prescription_Medicines (PM_id, M_Quantity, Medicine_id, Prescription_id) VALUES
(1, 2, 1, 1),
(2, 3, 2, 2),
(3, 1, 3, 3),
(4, 2, 4, 4),
(5, 3, 5, 5),
(6, 1, 5, 4),
(7, 2, 2, 7),
(8, 3, 8, 8),
(9, 1, 9, 2),
(10, 2, 10, 1);
