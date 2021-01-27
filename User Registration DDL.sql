CREATE TABLE systemadministrators (
	administratorid	INT(4),
	completename	VARCHAR(45),
	username		VARCHAR(45),
	password		VARCHAR(45),
	PRIMARY KEY (administratorid)
);

CREATE TABLE companyusers (
	companyid		INT(4),
	username		VARCHAR(45),
	password		VARCHAR(45),
	startdate		DATE,
	enddate			DATE,
	registeredby	INT(4),
	regdate			DATE,
	PRIMARY KEY (companyid),
	FOREIGN KEY (registeredby) REFERENCES systemadministrators (administratorid)
);

CREATE TABLE managers (
	managerid	INT(4),
	b			VARCHAR(45),
	PRIMARY KEY (managerid),
	FOREIGN KEY (managerid) REFERENCES companyusers (companyid)
);

CREATE TABLE travelofficers (
	toid			INT(4),
	a			VARCHAR(45),
	PRIMARY KEY (toid),
	FOREIGN KEY (toid) REFERENCES companyusers (companyid)
);

CREATE TABLE clients (
	clientid		INT(4),
	clientname	VARCHAR(45),
	clientaddr		VARCHAR(45),
	PRIMARY KEY (clientid)
);

CREATE TABLE transactions (
	transno				INT(4),
	transdate			DATE,
	transdesc			VARCHAR(45),
	travelofficerid		INT(4),
	clientid			INT(4),
	PRIMARY KEY (transno),
	FOREIGN KEY (travelofficerid)	REFERENCES travelofficers (toid),
	FOREIGN KEY (clientid)			REFERENCES clients (clientid)
);

CREATE TABLE issues (
	issueid			INT(4),
	raisedby		INT(4),
	decision		VARCHAR(45),
	transno			INT(4),
	description		VARCHAR(45),
    decidedby		INT(4),
	PRIMARY KEY (issueid),
	FOREIGN KEY (raisedby) 		REFERENCES companyusers (companyid),
	FOREIGN KEY (decidedby) 	REFERENCES managers (managerid),
	FOREIGN KEY (transno)		REFERENCES transactions (transno)
);

