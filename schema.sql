-- Create the Banking System database
CREATE DATABASE BankingSystem;

-- Use the database 
USE BankingSystem;
CREATE TABLE Customers (
Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
Name VARCHAR(100) NOT NULL,
Address VARCHAR(255),
Phone VARCHAR(15),
Email VARCHAR(100)
);
CREATE TABLE BankBranches (
Branch_ID INT AUTO_INCREMENT PRIMARY KEY,
Branch_Name VARCHAR(100),
Location VARCHAR(255),
Manager_Name VARCHAR(100)
);
CREATE TABLE Loans (
Loan_ID INT AUTO_INCREMENT PRIMARY KEY,
Customer_ID INT,
Branch_ID INT,
Loan_Type VARCHAR(50),
Principal_Amount DECIMAL(15, 2),
Interest_Rate DECIMAL(5, 2),
Start_Date DATE,
End_Date DATE,
EMI_Amount DECIMAL(15, 2),
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
FOREIGN KEY (Branch_ID) REFERENCES BankBranches(Branch_ID)
);
CREATE TABLE Transactions (
Transaction_ID INT AUTO_INCREMENT PRIMARY KEY,
Loan_ID INT,
Date DATE,
Amount DECIMAL(15, 2),
Payment_Type ENUM('EMI', 'Prepayment'),
FOREIGN KEY (Loan_ID) REFERENCES Loans(Loan_ID)
);

// There output images are in readme file.
 
INSERT INTO Customers (Name, Address, Phone, Email)
VALUES
('John Doe', '123 Main St', '9876543210', 'john.doe@example.com'),
('Jane Smith', '456 Oak Ave', '8765432109', 'jane.smith@example.com'),
('Alice Johnson', '789 Pine Rd', '9123456780', 'alice.johnson@example.com');
INSERT INTO BankBranches (Branch_Name, Location, Manager_Name)
VALUES
('SBI - Downtown', 'Downtown City', 'Mr. Rajesh Sharma'),
('HDFC - Uptown', 'Uptown City', 'Ms. Priya Mehra');
INSERT INTO Loans (Customer_ID, Branch_ID, Loan_Type, Principal_Amount, Interest_Rate, Start_Date, End_Date, EMI_Amount)
VALUES
(1, 1, 'Home Loan', 500000, 7.5, '2023-01-01', '2033-01-01', 5000),
(2, 2, 'Car Loan', 300000, 8.0, '2024-01-01', '2029-01-01', 6000),
(3, 1, 'Personal Loan', 200000, 10.5, '2023-06-01', '2028-06-01', 4500);
INSERT INTO Transactions (Loan_ID, Date, Amount, Payment_Type)
VALUES
(1, '2023-02-01', 5000, 'EMI'),
(1, '2023-03-01', 5000, 'EMI'),
(2, '2024-02-01', 6000, 'EMI'),
(3, '2023-07-01', 4500, 'EMI'),
(3, '2023-08-01', 4500, 'EMI'),
(1, '2023-04-01', 20000, 'Prepayment');
// There output images are in readme file.
