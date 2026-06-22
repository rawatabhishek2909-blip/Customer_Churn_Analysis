-- =====================================================
-- Query 5: Churn by Payment Method
-- Electronic check users churn nearly 3x more than autopay users
-- =====================================================
SELECT
    PaymentMethod,
    COUNT(*) AS Total,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN 1.0 ELSE 0 END) * 100, 2) AS Churn_Pct
FROM customers
GROUP BY PaymentMethod
ORDER BY Churn_Pct DESC;

-- Actual result: Electronic check 45.29% | Mailed check 19.11%
--                Bank transfer (auto) 16.71% | Credit card (auto) 15.24%
