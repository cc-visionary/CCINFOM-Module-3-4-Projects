-- User Registration -- 
CREATE TABLE system_administrators (
	administrator_id	INT(4),
	completename	    VARCHAR(45),
	username		    VARCHAR(45),
	password		    VARCHAR(45),
	PRIMARY KEY (administrator_id)
);

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

CREATE TABLE managers (
	manager_id	INT(4),
	b			VARCHAR(45),
	PRIMARY KEY (manager_id),
	FOREIGN KEY (manager_id) REFERENCES company_users (company_id)
);

CREATE TABLE travelofficers (
	to_id			INT(4),
	a			    VARCHAR(45),
	PRIMARY KEY (to_id),
	FOREIGN KEY (to_id) REFERENCES company_users (company_id)
);

CREATE TABLE clients (
	client_id		INT(4),
	client_name	    VARCHAR(45),
	client_addr		VARCHAR(45),
	country         VARCHAR(45),
	PRIMARY KEY (client_id)
);

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

--> Client Groups <--
CREATE TABLE client_groups (
	group_id              INT(4),
	start_date            DATE,
	end_date              DATE,
	group_representative  INT(4),
	PRIMARY KEY (group_id),
	FOREIGN KEY (group_representative) REFERENCES clients (client_id)
);

CREATE TABLE clients_in_groups (
	client_id   INT(4),
	group_id    INT(4),
	PRIMARY KEY (client_id),
	FOREIGN KEY (client_id) REFERENCES clients (client_id),
	FOREIGN KEY (group_id)  REFERENCES client_groups (group_id)
);
--> End of Client Groups <--

--> File Submission <--
CREATE TABLE file (
	file_id     INT(4),
	file_name   VARCHAR(45),
	file_type   VARCHAR(45),
	folder_name VARCHAR(45),
	company_id  INT(4),
	PRIMARY KEY (file_id),
	FOREIGN KEY (company_id) REFERENCES company_users (company_id)
);
--> End of File Submission <--
-- End of User Registration -- 

-- Cultural Class Provider -- 
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

CREATE TABLE cultural_class_providers (
	ccpregistration_id INT(4),
	FOREIGN KEY (ccpregistration_id) REFERENCES ccpregistration (ccpregistration_id)
);
-- End of Cultural Class Provider -- 

-- Booking Management --
CREATE TABLE courses (
	course_id             INT(4),
	name                  VARCHAR(45),
	description           VARCHAR(100),
	hours                 INT(4),
	venue_longitude       DECIMAL(9, 6),
	venue_latitude        DECIMAL(8, 6),
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

CREATE TABLE feedbacks (
	feedback_id INT(4),
	rating      ENUM('Very Bad', 'Bad', 'Neutral', 'Good', 'Very Good'),
	narrative   VARCHAR(500),
	PRIMARY KEY (feedback_id)
);

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
-- End of Booking Management --