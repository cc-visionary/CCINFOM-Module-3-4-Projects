CREATE DATABASE IF NOT EXISTS ccp;
USE ccp;

-- User Registration -- 
DROP TABLE IF EXISTS system_administrators;
CREATE TABLE system_administrators (
	administrator_id	INT(4),
	completename	    VARCHAR(45),
	username		    VARCHAR(45),
	password		    VARCHAR(45),
	PRIMARY KEY (administrator_id)
);

INSERT INTO system_administrators VALUES (101,'Cody Fulton','suitelifeofcody',12345);

DROP TABLE IF EXISTS company_users;
CREATE TABLE company_users (
	company_id		INT(4),
	username		VARCHAR(45),
	password		VARCHAR(45),
	start_date		DATE,
	end_date		DATE,
	registered_by	INT(4),
	reg_date		DATE,
	PRIMARY KEY (company_id),
	FOREIGN KEY (registered_by) REFERENCES system_administrators (administrator_id)
);

INSERT INTO company_users VALUES (201,'beforesunset',12345,'2021-01-01',NULL,101,'2021-01-01'), (202,'riverlettuce',12345,'2021-01-02',NULL,101,'2021-01-02'), (203,'organsnowstorm',12345,'2021-01-03',NULL,101,'2021-01-03');

DROP TABLE IF EXISTS managers;
CREATE TABLE managers (
	manager_id	INT(4),
	b			VARCHAR(45),
	PRIMARY KEY (manager_id),
	FOREIGN KEY (manager_id) REFERENCES company_users (company_id)
);

INSERT INTO managers VALUES (201,NULL);

DROP TABLE IF EXISTS travelofficers;
CREATE TABLE travelofficers (
	to_id			INT(4),
	a			    VARCHAR(45),
	PRIMARY KEY (to_id),
	FOREIGN KEY (to_id) REFERENCES company_users (company_id)
);

INSERT INTO travelofficers VALUES (202,NULL),(203,NULL);

DROP TABLE IF EXISTS clients;
CREATE TABLE clients (
	client_id		INT(4),
	client_name	    VARCHAR(45),
	client_addr		VARCHAR(150),
	country         VARCHAR(45),
	PRIMARY KEY (client_id)
);

INSERT INTO clients VALUES (301,'Ismaeel Leal','Kikutamachi Wasehara, Fukushima-ken, JP, 963-1309','Japan'),(302,'Emmett Watts','446, El Tarter, Chittagong Division, BD, 2053','Bangladesh'),(303, 'Lydia Cardenas','685, Latta Road, New Hampshire, US, 5882','United States');

DROP TABLE IF EXISTS transactions;
CREATE TABLE transactions (
	trans_no			INT(4),
	trans_date			DATE,
	trans_desc			VARCHAR(45),
	travelofficer_id	INT(4),
	client_id			INT(4),
	PRIMARY KEY (trans_no),
	FOREIGN KEY (travelofficer_id)	REFERENCES travelofficers (to_id),
	FOREIGN KEY (client_id)			REFERENCES clients (client_id)
);

INSERT INTO transactions VALUES (8521,'2021-01-01',NULL,202,301), (8522,'2021-01-01',NULL,203,303);

DROP TABLE IF EXISTS issues;
CREATE TABLE issues (
	issue_id		INT(4),
	raised_by		INT(4),
	decision		VARCHAR(45),
	trans_no		INT(4),
	description		VARCHAR(45),
    decided_by		INT(4),
	PRIMARY KEY (issue_id),
	FOREIGN KEY (raised_by) 	REFERENCES company_users (company_id),
	FOREIGN KEY (decided_by) 	REFERENCES managers (manager_id),
	FOREIGN KEY (trans_no)		REFERENCES transactions (trans_no)
);

INSERT INTO issues VALUES (4321,203,NULL,8522,'Payment for Course',201),(4322,203,NULL,8521,'Payment for Course',201);

-- Client Groups --
DROP TABLE IF EXISTS client_groups;
CREATE TABLE client_groups (
	group_id              INT(4),
	start_date            DATE,
	end_date              DATE,
	group_representative  INT(4),
	PRIMARY KEY (group_id),
	FOREIGN KEY (group_representative) REFERENCES clients (client_id)
);

INSERT INTO client_groups VALUES (1,'2021-01-01',NULL,301);

DROP TABLE IF EXISTS clients_in_groups;
CREATE TABLE clients_in_groups (
	client_id   INT(4),
	group_id    INT(4),
	PRIMARY KEY (client_id),
	FOREIGN KEY (client_id) REFERENCES clients (client_id),
	FOREIGN KEY (group_id)  REFERENCES client_groups (group_id)
);

INSERT INTO clients_in_groups VALUES (301, 1), (302, 1);
-- End of Client Groups --

-- File Submission --
DROP TABLE IF EXISTS file;
CREATE TABLE file (
	file_id     INT(4),
	file_name   VARCHAR(45),
	file_type   VARCHAR(45),
	folder_name VARCHAR(45),
	company_id  INT(4),
	PRIMARY KEY (file_id),
	FOREIGN KEY (company_id) REFERENCES company_users (company_id)
);

INSERT INTO file VALUES (321,'passport','image','passports',201);

-- End of File Submission --
-- End of User Registration -- 

-- Cultural Class Provider -- 
DROP TABLE IF EXISTS ccpregistration;
CREATE TABLE ccpregistration (
	ccpregistration_id             INT(4),
	client_id                      INT(4),
	position                       VARCHAR(45),
	years_in_organization          INT(3),
	scanned_organizationid         LONGBLOB,
	scanned_barangay_clearance     LONGBLOB,
	scanned_police_clearance       LONGBLOB,
	notarized_appointment          LONGBLOB,
	government_certification       LONGBLOB, 
	reason_for_disapproval         VARCHAR(45),
	file_id                        INT(4),
	approved_by                    INT(4),
	PRIMARY KEY (ccpregistration_id),
	FOREIGN KEY (client_id)   REFERENCES clients (client_id),
	FOREIGN KEY (file_id)     REFERENCES file (file_id),
	FOREIGN KEY (approved_by) REFERENCES managers (manager_id)
);

INSERT INTO ccpregistration VALUES (123,303,'Cultural Classes Provider',2,NULL,NULL,NULL,NULL,NULL,NULL,321,201);

DROP TABLE IF EXISTS cultural_class_providers;
CREATE TABLE cultural_class_providers (
	ccpregistration_id INT(4),
	FOREIGN KEY (ccpregistration_id) REFERENCES ccpregistration (ccpregistration_id)
);

INSERT INTO cultural_class_providers VALUES (123);
-- End of Cultural Class Provider -- 

-- Booking Management --
DROP TABLE IF EXISTS courses;
CREATE TABLE courses (
	course_id             INT(4),
	name                  VARCHAR(45),
	description           VARCHAR(100),
	hours                 INT(4),
	venue_longitude       DECIMAL(9, 2),
	venue_latitude        DECIMAL(9, 2),
	date                  DATE,
	inclusions            VARCHAR(200),
	fee                   DECIMAL(8, 2),
	minimum_participants  INT(4),
	maximum_participants  INT(4),
	lecturer_name 	      VARCHAR(45),
	open_for_enrollment   BIT,
	is_confirmed          BIT,
	is_completed          BIT,
	creator               INT(4),
	PRIMARY KEY (course_id),
	FOREIGN KEY (creator) REFERENCES cultural_class_providers (ccpregistration_id)
);

INSERT INTO courses VALUES (12,'How to Meditate','Learn how to meditate through experienced trainers.',3,-28.8,78.98,'2021-01-01',NULL,50,1,5,'Crystal Brown',1,1,1,123),(13,'Time Management','Learn how to manage your time with the help of proven time management experts.',4.5,14.56,120.99,'2021-03-01',NULL,75,1,5,'Jake Trinity',1,1,0,123);

DROP TABLE IF EXISTS feedbacks;
CREATE TABLE feedbacks (
	feedback_id INT(4),
	rating      ENUM('Very Bad', 'Bad', 'Neutral', 'Good', 'Very Good'),
	narrative   VARCHAR(500),
	PRIMARY KEY (feedback_id)
);

INSERT INTO feedbacks VALUES (541, 5, 'It was an amazing class!');

DROP TABLE IF EXISTS course_bookings;
CREATE TABLE course_bookings (
	course_bookings_id INT(4),
	course_id          INT(4),
	client_id          INT(4),
	feedback_id        INT(4),
	date_cancelled     DATE,
	PRIMARY KEY (course_bookings_id),
	FOREIGN KEY (course_id)   REFERENCES courses (course_id), 
	FOREIGN KEY (client_id)   REFERENCES clients (client_id),
	FOREIGN KEY (feedback_id) REFERENCES feedbacks (feedback_id)
);

INSERT INTO course_bookings VALUES (351,12,301,541,NULL),(352,13,301,NULL,NULL);
-- End of Booking Management --