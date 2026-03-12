SELECT 
    job_posted_date::DATE AS date,
    job_posted_date::TIME AS time,
    job_posted_date::TIMESTAMP AS timestamp,
    job_posted_date::TIMESTAMPZ AS timestampz
FROM job_postings_fact
LIMIT 10; 

-- Use EXTRACT
SELECT 
    job_posted_date,
    EXTRACT(MONTH FROM job_posted_date) AS job_posted_month,
    EXTRACT(YEAR FROM job_posted_date) AS job_posted_year
FROM job_postings_fact
ORDER BY RANDOM()
LIMIT 10;

-- Use DATE_TRUNC
SELECT
    DATE_TRUNC('month', job_posted_date) AS job_posted_month,
    COUNT(job_id) AS job_count
FROM job_postings_fact
WHERE job_title_short = 'Data Engineer'
    AND EXTRACT(YEAR FROM job_posted_date) = 2024
    -- AND DATE_TRUNC('year', job_posted_date) = '2024-01-01' (this is harder to read compared to EXTRACT)
GROUP BY
    DATE_TRUNC('month', job_posted_date)
ORDER BY
    job_posted_month;

-- Use AT TIME ZONE 
SELECT
    job_title_short,
    job_location,
    job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST'
FROM
    job_postings_fact
WHERE
    job_location LIKE 'New York, NY'
ORDER BY job_posted_date DESC
LIMIT 15;