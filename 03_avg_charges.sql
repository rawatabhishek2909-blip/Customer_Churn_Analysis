-- =====================================================
-- Query 3: Average Charges & Tenure -- Churned vs Retained
-- Reveals pricing pressure and loyalty as churn drivers
-- =====================================================
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charge,
    ROUND(AVG(tenure), 1) AS Avg_Tenure_Months,
    ROUND(AVG(TotalCharges), 2) AS Avg_Total_Revenue
FROM customers
GROUP BY Churn;

-- Actual result: Churned avg $74.44/mo, 17.98 months tenure
--                Retained avg $61.27/mo, 37.57 months tenure
