#Case Study 2: Investigating Metric Spike
#1. Weekly User for event_type==>Engagement
SELECT * FROM events;
SELECT extract(week FROM occurred_at) AS Week_number, count(DISTINCT user_id) AS 'Count of Active Users'
FROM events 
WHERE event_type="engagement"
GROUP BY Week_number
ORDER BY Week_number;