-- =====================================================
-- Query 2: Churn by Contract Type
-- Month-to-month is the single biggest churn driver
-- =====================================================
SELECT
    Contract,
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100, 2) AS Churn_Pct
FROM customers
GROUP BY Contract
ORDER BY Churn_Pct DESC;

-- Actual result: Month-to-month 42.71% | One year 11.27% | Two year 2.83%
