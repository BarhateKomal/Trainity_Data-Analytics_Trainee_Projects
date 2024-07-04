#1.Number of Jobs Reviewed per hour for each day In November 2020
SELECT ds AS "Date in Nov 2020",
round(((count(job_id)/sum(time_spent))*60*60)) AS "Jobs Viewed Per Hour Each Day" 
FROM jobData 
WHERE ds BETWEEN "01-11-2020" AND "30-11-2020" GROUP BY ds;

#2.Calculate 7 day rolling avg throughput(no. of events happening per sec)
SELECT round((count(event)/sum(time_spent)),7) AS Weekly_throughput , ds AS DATE
FROM jobData GROUP BY date;
#calc daily metric throughput
SELECT ds AS DATE, round((count(event)/sum(time_spent)),2) AS Daily_Metric 
FROM jobData
GROUP BY ds
ORDER BY ds;

#3.Calculate percentage share of each language in 30 days
SELECT language AS Languages,COUNT(job_id) AS 'Total count of jobs',
		ROUND(100.0 * COUNT(job_id)  / total,2) AS Percentage, sub.total
FROM jobData 
CROSS JOIN(SELECT COUNT(job_id) AS total FROM jobData) AS sub
GROUP BY language,sub.total;

#4.Duplicate rows Detection (actor)
SELECT *
FROM jobData
WHERE actor_id IN (
    SELECT actor_id
    FROM jobData
    GROUP BY actor_id
    HAVING COUNT(actor_id) > 1
);

#4.Duplication rows for job
SELECT *
FROM jobData
WHERE job_id IN (
    SELECT job_id
    FROM jobData
    GROUP BY job_id
    HAVING COUNT(job_id) > 1
);