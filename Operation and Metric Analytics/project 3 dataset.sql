CREATE database Project3;
SHOW databases;
USE Project3;
#Table-1 users
create table users(
user_id int,
created_at varchar(100),
company_id int,
language varchar(50),
activated_at varchar(100),
state varchar(50));
SHOW VARIABLES LIKE "secure_file_priv";
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Table-1 users.csv"
INTO TABLE users 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
SELECT * FROM users;
ALTER TABLE users ADD COLUMN temp_created_at DATETIME;
UPDATE users SET temp_created_at = STR_TO_DATE(created_at, '%d-%m-%Y %H:%i');
ALTER TABLE users DROP COLUMN created_at;
ALTER TABLE users CHANGE COLUMN temp_created_at created_at DATETIME;

#Table-2 events
CREATE TABLE events(
user_id INT NULL,
occurred_at VARCHAR(100) NULL,
event_type VARCHAR(50) NULL,
event_name VARCHAR(100) NULL,
location VARCHAR(50) NULL,
device VARCHAR(50) NULL,
user_type INT NULL);

LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Table-2 events.csv"
INTO TABLE events
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
desc events;
ALTER TABLE events ADD COLUMN temp_occurred_at DATETIME;
UPDATE events SET temp_occurred_at = STR_TO_DATE(occurred_at, '%d-%m-%Y %H:%i');
ALTER TABLE events DROP COLUMN occurred_at;
ALTER TABLE events CHANGE COLUMN temp_occurred_at occurred_at DATETIME;

#Table-3 email_events
CREATE TABLE emailEvents(
user_id INT,
occurred_at VARCHAR(100),
action VARCHAR(50),
user_type INT);
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/email_events.csv"
INTO TABLE emailEvents
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
SELECT * FROM emailEvents;

#Table-3 Job_data
CREATE TABLE jobData(
ds VARCHAR(50),
job_id INT,
actor_id INT,
event CHAR(100),
language CHAR(100),
time_spent INT,
org CHAR(50));
LOAD DATA INFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/job_data.csv"
INTO TABLE jobData
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"' 
LINES TERMINATED BY '\n' 
IGNORE 1 ROWS;
