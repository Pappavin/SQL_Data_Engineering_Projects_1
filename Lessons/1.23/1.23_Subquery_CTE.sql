-- Subquery
SELECT *
FROM (
    SELECT *
    FROM job_postings_fact jpf
    WHERE jpf.salary_year_avg IS NOT NULL
        OR jpf.salary_hour_avg IS NOT NULL
) AS valid_salaries
LIMIT 10;

-- CTE
WITH valid_salaries AS (
    SELECT *
    FROM job_postings_fact jpf
    WHERE jpf.salary_year_avg IS NOT NULL
        OR jpf.salary_hour_avg IS NOT NULL
)
SELECT *
FROM valid_salaries
LIMIT 10;

