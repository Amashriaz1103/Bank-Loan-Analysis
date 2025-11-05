-- For selecting or to see whole Dataset
SELECT * FROM bank_loan_data


-- Counting the Number of Loan Application
SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan_data

-- Finding Month to Date Application
SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021

-- for finding Previous Month to Date Application
SELECT COUNT(id) AS MTD_Total_Loan_Applications FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date)= 2021


-- For Total Funded Amount
SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data

-- Finding MTD Total Funded Amount
SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021

-- Finding PMTD Total Funded Amount
SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date)= 2021


-- For Total Amount Received 
SELECT SUM(total_payment) AS Total_Amount_Received FROM bank_loan_data

-- Finding MTD Total Amount Received
SELECT SUM(loan_amount) AS MTD_Total_Amount_Received FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021

-- Finding PMTD Total Amount Received
SELECT SUM(loan_amount) AS PMTD_Total_Amount_Received FROM bank_loan_data
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date)= 2021


-- For Average Interest Rate
SELECT AVG(int_rate) * 100 AS Avg_Interest_rate FROM bank_loan_data

-- For Round Up Value
SELECT ROUND(AVG(int_rate), 4) * 100 AS Avg_Interest_rate FROM bank_loan_data

-- For MTD/PMTD Average Interest Rate
SELECT ROUND(AVG(int_rate), 4) * 100 AS MTD_Avg_Interest_rate FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021


-- For Debt To Income Ratio
SELECT AVG(int_rate) * 100 AS Avg_Interest_rate FROM bank_loan_data

-- For MTD/PMTD Debt To Income Ratio
SELECT ROUND(AVG(dti), 4) * 100 AS MTD_Avg_DTI FROM bank_loan_data
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)= 2021


-- GOOD LOAN KPI'S
-- Good Loan Application Percentage
SELECT (COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END) * 100)
/
COUNT(id) AS Good_loan_percentage FROM bank_loan_data

-- For Good Loan Applications
SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Funded Amount
SELECT SUM(loan_amount) AS Good_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'


-- BAD LOAN KPI'S
-- Bad Loan Percentage
SELECT(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100.0) / 
	COUNT(id) AS Bad_Loan_Percentage FROM bank_loan_data

-- Bad Loan Applications
SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loan Funded Amount
SELECT SUM(loan_amount) AS Bad_Loan_Funded_amount FROM bank_loan_data
WHERE loan_status = 'Charged Off'

-- Bad Loan Amount Received
SELECT SUM(total_payment) AS Bad_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Charged Off'


-- Loan Status Grid View

