-- =====================================================
-- Query 6: High-Risk Customer Segmentation (Window Function)
-- NTILE buckets retained, month-to-month customers by tenure & spend
-- to flag who is most likely to churn next
-- =====================================================
SELECT
    customerID,
    tenure,
    MonthlyCharges,
    Contract,
    PaymentMethod,
    NTILE(4) OVER (ORDER BY MonthlyCharges DESC) AS Charge_Quartile,
    NTILE(4) OVER (ORDER BY tenure ASC) AS Tenure_Quartile,
    CASE
        WHEN NTILE(4) OVER (ORDER BY tenure ASC) = 1
         AND NTILE(4) OVER (ORDER BY MonthlyCharges DESC) = 1
        THEN 'HIGH RISK'
        ELSE 'MONITOR'
    END AS Risk_Flag
FROM customers
WHERE Churn = 'No' AND Contract = 'Month-to-month';

-- Actual result: 32 customers flagged HIGH RISK (lowest tenure + highest charges
-- among still-active month-to-month customers) -- this is the Top-20 table on Page 2
