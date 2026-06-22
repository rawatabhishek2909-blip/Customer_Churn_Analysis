-- =====================================================
-- Query 7: Senior Citizen Churn Analysis
-- Seniors churn at nearly double the rate of non-seniors
-- =====================================================
SELECT
    CASE WHEN SeniorCitizen = 1 THEN 'Senior' ELSE 'Non-Senior' END AS Segment,
    COUNT(*) AS Total,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100, 2) AS Churn_Pct,
    ROUND(AVG(MonthlyCharges), 2) AS Avg_Monthly_Charge
FROM customers
GROUP BY SeniorCitizen;

-- Actual result: Senior 41.68% churn ($79.82 avg) | Non-Senior 23.61% churn ($61.85 avg)
