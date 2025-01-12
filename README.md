# Case-Study: Banking System for Loan Management

-- Create the Banking System database<br>
CREATE DATABASE BankingSystem;

-- Use the database
USE BankingSystem;<br>
CREATE TABLE Customers (<br>
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,<br>
    Name VARCHAR(100) NOT NULL,<br>
    Address VARCHAR(255),<br>
    Phone VARCHAR(15),<br>
    Email VARCHAR(100)<br>
);<br>
CREATE TABLE BankBranches (<br>
    Branch_ID INT AUTO_INCREMENT PRIMARY KEY,<br>
    Branch_Name VARCHAR(100),<br>
    Location VARCHAR(255),<br>
    Manager_Name VARCHAR(100)<br>
);<br>
CREATE TABLE Loans (<br>
    Loan_ID INT AUTO_INCREMENT PRIMARY KEY,<br>
    Customer_ID INT,<br>
    Branch_ID INT,<br>
    Loan_Type VARCHAR(50),<br>
    Principal_Amount DECIMAL(15, 2),<br>
    Interest_Rate DECIMAL(5, 2),<br>
    Start_Date DATE,<br>
    End_Date DATE,<br>
    EMI_Amount DECIMAL(15, 2),<br>
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),<br>
    FOREIGN KEY (Branch_ID) REFERENCES BankBranches(Branch_ID)<br>
);<br>
CREATE TABLE Transactions (<br>
    Transaction_ID INT AUTO_INCREMENT PRIMARY KEY,<br>
    Loan_ID INT,<br>
    Date DATE,<br>
    Amount DECIMAL(15, 2),<br>
    Payment_Type ENUM('EMI', 'Prepayment'),<br>
    FOREIGN KEY (Loan_ID) REFERENCES Loans(Loan_ID)<br>
);<br>
 ![Screenshot 2025-01-13 022752](https://github.com/user-attachments/assets/df92b033-e43d-42e4-a104-f1dbaefc2706)
<br>
INSERT INTO Customers (Name, Address, Phone, Email)<br>
VALUES<br>
('John Doe', '123 Main St', '9876543210', 'john.doe@example.com'),<br>
('Jane Smith', '456 Oak Ave', '8765432109', 'jane.smith@example.com'),<br>
('Alice Johnson', '789 Pine Rd', '9123456780', 'alice.johnson@example.com');<br>
INSERT INTO BankBranches (Branch_Name, Location, Manager_Name)<br>
VALUES<br>
('SBI - Downtown', 'Downtown City', 'Mr. Rajesh Sharma'),<br>
('HDFC - Uptown', 'Uptown City', 'Ms. Priya Mehra');<br>
INSERT INTO Loans (Customer_ID, Branch_ID, Loan_Type, Principal_Amount, Interest_Rate, Start_Date, End_Date, EMI_Amount)<br>
VALUES<br>
(1, 1, 'Home Loan', 500000, 7.5, '2023-01-01', '2033-01-01', 5000),<br>
(2, 2, 'Car Loan', 300000, 8.0, '2024-01-01', '2029-01-01', 6000),<br>
(3, 1, 'Personal Loan', 200000, 10.5, '2023-06-01', '2028-06-01', 4500);<br>
INSERT INTO Transactions (Loan_ID, Date, Amount, Payment_Type)<br>
VALUES<br>
(1, '2023-02-01', 5000, 'EMI'),<br>
(1, '2023-03-01', 5000, 'EMI'),<br>
(2, '2024-02-01', 6000, 'EMI'),<br>
(3, '2023-07-01', 4500, 'EMI'),<br>
(3, '2023-08-01', 4500, 'EMI'),<br>
(1, '2023-04-01', 20000, 'Prepayment');<br>
 ![Screenshot 2025-01-13 023230](https://github.com/user-attachments/assets/d8f4f09f-fcb5-4bd5-8a97-4848f98ea589)

