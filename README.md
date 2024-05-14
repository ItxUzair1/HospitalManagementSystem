### Hospital Management System (HMS)

The Hospital Management System (HMS) is a comprehensive software solution designed to streamline the administrative and clinical operations of a healthcare facility. It provides functionalities for managing patient records, scheduling appointments, handling billing and payments, managing inventory, and more. The HMS aims to improve the efficiency of healthcare delivery, enhance patient care, and optimize resource utilization within the hospital.

### Database Schema

The database schema for the Hospital Management System consists of several tables that store information related to patients, doctors, nurses, medical records, appointments, prescriptions, bills, and more. Here's an overview of the main tables in the database:

- **Room**: Stores information about rooms available in the hospital.
- **Department**: Contains details about different departments within the hospital.
- **Patient**: Stores information about patients admitted to the hospital.
- **Bill**: Stores billing information for patients, including room costs, test costs, medication costs, and total charges.
- **StaffRecord**: Contains details about hospital staff, including doctors, nurses, and other employees.
- **MedicalRecord**: Stores medical records and pre-existing conditions of patients.
- **Doctor**: Stores information about doctors, including their specialization and contact details.
- **Appointment**: Contains details about appointments scheduled between patients and doctors.
- **Prescription**: Stores prescription details issued by doctors to patients.
- **Nurse**: Stores information about nurses working in different departments.
- **Medicine**: Contains details about medicines available in the hospital.
- **Assignements**: Stores assignments of nurses to patients.
- **Prescription_Medicines**: Associates medicines with prescriptions, indicating the medications prescribed to patients.

### Installation Instructions

To install the Hospital Management System database, follow these steps:

1. Ensure that you have a compatible database management system (DBMS) installed, such as MySQL, PostgreSQL, or SQLite.
2. Copy the provided SQL script containing the database schema and data.
3. Execute the SQL script in your DBMS environment to create the database schema and populate it with sample data.
4. Verify that the database has been created successfully by querying its tables and viewing the data.
