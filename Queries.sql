## Description of tables
describe Customers;
describe Loans;
describe Transactions;
describe BankBranches;

## Displaying tables
select * from Customers;
select * from Loans;
select * from Transactions;
select * from BankBranches;

## Applying complex queries on tables
1. Calculate Total EMI Paid for Each Loan
sql:SELECT 
    Loan_ID,
    SUM(CASE WHEN Payment_Type = 'EMI' THEN Amount ELSE 0 END) AS Total_EMI_Paid
    FROM 
    Transactions
    GROUP BY 
    Loan_ID;

2. Calculate Outstanding Balance for Each Loan
    sql:SELECT 
    l.Loan_ID,
    l.Principal_Amount - COALESCE(SUM(t.Amount), 0) AS Outstanding_Balance
    FROM 
    Loans l
    LEFT JOIN 
    Transactions t ON l.Loan_ID = t.Loan_ID
    GROUP BY 
    l.Loan_ID, l.Principal_Amount;

3. Generate EMI Schedule for a Loan
sql:SELECT 
    l.Loan_ID,
    l.Start_Date,
    DATE_ADD(l.Start_Date, INTERVAL n MONTH) AS EMI_Due_Date,
    l.EMI_Amount
    FROM 
    Loans l
    CROSS JOIN 
    (SELECT 0 AS n UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) AS numbers
    WHERE 
    Loan_ID = 1
    AND DATE_ADD(l.Start_Date, INTERVAL n MONTH) <= l.End_Date;

4. Identify Fully Paid Loans 
sql:SELECT 
    l.Loan_ID,
    l.Principal_Amount,
    COALESCE(SUM(t.Amount), 0) AS Total_Paid,
    CASE 
        WHEN COALESCE(SUM(t.Amount), 0) >= l.Principal_Amount THEN 'Fully Paid'
        ELSE 'Outstanding'
    END AS Loan_Status
    FROM 
    Loans l
    LEFT JOIN 
    Transactions t ON l.Loan_ID = t.Loan_ID
    GROUP BY 
    l.Loan_ID, l.Principal_Amount;

5. Calculate Total Interest Collected for Each Loan
sql: SELECT 
    l.Loan_ID,
    SUM(t.Amount) - l.Principal_Amount AS Total_Interest_Collected
    FROM 
    Loans l
    JOIN 
    Transactions t ON l.Loan_ID = t.Loan_ID
    GROUP BY 
    l.Loan_ID, l.Principal_Amount;

6. Find Branches with the Highest Loan Disbursement
sql:SELECT 
    bb.Branch_Name,
    SUM(l.Principal_Amount) AS Total_Disbursement
    FROM 
    BankBranches bb
    JOIN 
    Loans l ON bb.Branch_ID = l.Branch_ID
    GROUP BY 
    bb.Branch_Name
    ORDER BY 
    Total_Disbursement DESC
    LIMIT 1;

7. Retrieve Customers with Multiple Loans
sql:SELECT 
    c.Customer_ID,
    c.Name,
    COUNT(l.Loan_ID) AS Total_Loans
    FROM 
    Customers c
    JOIN 
    Loans l ON c.Customer_ID = l.Customer_ID
    GROUP BY 
    c.Customer_ID, c.Name
    HAVING 
    COUNT(l.Loan_ID) > 1;



*Note:- All the output images for these will be provided.


