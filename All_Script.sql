-- Create a consolidated table with necessary customer data
CREATE TABLE IF NOT EXISTS customer_data_combined AS (
    SELECT 
        h.clientnum,
        s.status,
        h.customer_age,
        h.gender,
        h.dependent_count,
        e.education_level AS education,
        m.marital_status AS marital,
        h.income_category,
        c.card_category,
        h.months_on_book,
        h.total_relationship_count,
        h.months_inactive_12_mon,
        h.contacts_count_12_mon,
        ROUND(h.credit_limit, 0) AS credit_limit,
        ROUND(h.total_revolving_bal, 0) AS total_revolving_bal,
        ROUND(h.avg_open_to_buy, 0) AS avg_open_to_buy,
        ROUND(h.total_trans_amt, 0) AS total_trans_amt,
        ROUND(h.total_trans_ct, 0) AS total_trans_ct,
        ROUND(h.avg_utilization_ratio, 2) AS avg_utilization_ratio
    FROM customer_data_history h
    LEFT JOIN status_db s ON h.idstatus = s.id
    LEFT JOIN education_db e ON h.educationid = e.id
    LEFT JOIN marital_db m ON h.maritalid = m.id
    LEFT JOIN category_db c ON h.card_categoryid = c.id
);


-- Create a view for churn analysis with segmentation
CREATE VIEW churn_analysis AS (
    SELECT 
        *,
        CASE
            WHEN customer_age <= 25 THEN 'below 26'
            WHEN customer_age <= 35 THEN '26-35'
            WHEN customer_age <= 45 THEN '36-45'
            WHEN customer_age <= 55 THEN '46-55'
            WHEN customer_age <= 65 THEN '56-65'
            WHEN customer_age > 65 THEN 'older than 65'
        END AS age_segment,
        ROUND((FLOOR(CAST(avg_utilization_ratio AS DECIMAL) * 10)/10), 1) AS utilization_segment,
        CEILING(CAST(months_on_book AS DECIMAL) / 12) AS years_on_book,
        FLOOR(CAST(credit_limit AS DECIMAL) / 1000) * 1000 AS credit_limit_segment,
        FLOOR(CAST(total_revolving_bal AS DECIMAL) / 100) * 100 AS revolving_bal_segment,
        FLOOR(CAST(avg_open_to_buy AS DECIMAL) / 1000) * 1000 AS open_to_buy_segment,
        FLOOR(CAST(total_trans_amt AS DECIMAL) / 1000) * 1000 AS total_trans_amt_segment,
        FLOOR(CAST(total_trans_ct AS DECIMAL) / 10) * 10 AS total_trans_freq_segment
    FROM customer_data_combined
    WHERE status = 'Attrited Customer'
);


-- Queries for Data Exploration and Insight Presentation
-- Percentage of churned customers by status
CREATE TABLE v_cust_percent AS (
    SELECT 
        t1.status, 
        t1.cust_count,
        ROUND(((t1.cust_count / total.total_cust_count) * 100), 2) AS percentage
    FROM (
        SELECT 
            status, 
            COUNT(*) AS cust_count
        FROM customer_data_combined
        GROUP BY status
    ) AS t1
    CROSS JOIN (
        SELECT SUM(cust_count) AS total_cust_count
        FROM (
            SELECT 
                status, 
                COUNT(*) AS cust_count
            FROM customer_data_combined
            GROUP BY status
        ) AS total
    ) AS total
);


-- Distribution of churned customers by age segment
CREATE TABLE churn_age_distribution AS (
    SELECT 
        age_segment, 
        COUNT(*) AS total_customers
    FROM (
        SELECT 
            CASE
                WHEN customer_age <= 25 THEN 'below 26'
                WHEN customer_age <= 35 THEN '26-35'
                WHEN customer_age <= 45 THEN '36-45'
                WHEN customer_age <= 55 THEN '46-55'
                WHEN customer_age <= 65 THEN '56-65'
                WHEN customer_age > 65 THEN 'older than 65'
            END AS age_segment
        FROM churn_analysis
    ) AS age_segmented
    GROUP BY age_segment
);


-- Income category distribution among churned customers by gender
CREATE TABLE churn_income_gender_distribution AS (
    SELECT 
        gender,
        income_category,
        COUNT(*) AS total_customers
    FROM churn_analysis
    GROUP BY gender, income_category
);


