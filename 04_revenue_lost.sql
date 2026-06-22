-- =====================================================
-- Query 4: Revenue Lost Due to Churn
-- The headline financial-impact number for the resume bullet
-- =====================================================
SELECT
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN MonthlyCharges ELSE 0 END), 2) AS Monthly_Revenue_Lost,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN TotalCharges ELSE 0 END), 2) AS Total_Revenue_Lost,
    ROUND(SUM(CASE WHEN Churn = 'No' AND Contract = 'Month-to-month'
               THEN MonthlyCharges ELSE 0 END), 2) AS Revenue_At_Risk
FROM customers;

-- Actual result: Monthly_Revenue_Lost=$139,130.85 | Total_Revenue_Lost=$2,862,926.90
--                Revenue_At_Risk (still-active month-to-month)=$136,447.05
