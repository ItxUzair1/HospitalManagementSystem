#query 1 Find the total bills of all patients
SELECT p.Patient_id, p.Patient_Fname, p.Patient_Lname, SUM(b.Total) AS Total_Bill_Amount
FROM Patient p
JOIN Bill b ON p.Patient_id = b.patient_id
GROUP BY p.Patient_id, p.Patient_Fname, p.Patient_Lname;


#query2 Retrieve all patients along with their assigned doctors
SELECT p.Patient_id, p.Patient_Fname, p.Patient_Lname, d.Doctor_id, d.Specialization
FROM Patient p
JOIN Appointment a ON p.Patient_id = a.Patient_id
JOIN Doctor d ON a.Doctor_id = d.Doctor_id;


#query 3 
SELECT *
FROM Patient
WHERE Admission_Date > '2024-04-15';
