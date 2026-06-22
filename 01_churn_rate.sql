-- =====================================================
-- Query 1: Overall Churn Rate
-- The single most important KPI on the dashboard
-- =====================================================
SELECT
    COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Churn = 'No' THEN 1 ELSE 0 END) AS Retained_Customers,
    ROUND(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS Churn_Rate_Pct
FROM customers;

-- Actual result on this dataset: Total=7043, Churned=1869, Retained=5174, Rate=26.54%
