DROP VIEW IF EXISTS Dev_SE5.view_projects;
DROP VIEW IF EXISTS Dev_SE5.view_student_projects;

DROP TABLE IF EXISTS Dev_SE5.student_project;
DROP TABLE IF EXISTS Dev_SE5.final_projects;
DROP TABLE IF EXISTS Dev_SE5.lecturer_info;
DROP TABLE IF EXISTS Dev_SE5.student_info;
DROP TABLE IF EXISTS Dev_SE5.list_programmes;
DROP TABLE IF EXISTS Dev_SE5.list_studyLevel;
DROP TABLE IF EXISTS Dev_SE5.list_school;


/* -------------------------------------------------------------------------------------------------------------------------------- */
/* TABLES */


CREATE TABLE Dev_SE5.list_school (
  schoolID int NOT NULL AUTO_INCREMENT,
  schoolName varchar(250) DEFAULT 'NA' NOT NULL,
  CONSTRAINT list_school_PK PRIMARY KEY (schoolID)
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COLLATE=latin1_swedish_ci;


CREATE TABLE Dev_SE5.list_studyLevel (
	studyLevelID INT auto_increment NOT NULL,
	studyLevelName varchar(250) DEFAULT 'NA' NOT NULL,
	CONSTRAINT list_studyLevel_PK PRIMARY KEY (studyLevelID)
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COLLATE=latin1_swedish_ci;


CREATE TABLE Dev_SE5.list_programmes (
	programmeID INT auto_increment NOT NULL,
	programmeName varchar(250) DEFAULT 'NA' NOT NULL,
	programmeLevel INT DEFAULT -1 NOT NULL,
	school INT DEFAULT -1 NOT NULL,
	CONSTRAINT list_programmes_PK PRIMARY KEY (programmeID),
	CONSTRAINT list_programmes_UN UNIQUE KEY (programmeName),
	CONSTRAINT list_programmes_FK FOREIGN KEY (school) REFERENCES Dev_SE5.list_school(schoolID) ON UPDATE CASCADE,
	CONSTRAINT list_programmes_FK_1 FOREIGN KEY (programmeLevel) REFERENCES Dev_SE5.list_studyLevel(studyLevelID) ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COLLATE=latin1_swedish_ci;


CREATE TABLE Dev_SE5.student_info (
	studID varchar(100) DEFAULT 'NA' NOT NULL,
	studName varchar(250) DEFAULT 'NA' NOT NULL,
	studEmail varchar(250) DEFAULT 'NA' NOT NULL,
	studTelNum varchar(100) DEFAULT 'NA' NOT NULL,
    studProgramme INT DEFAULT -1 NOT NULL,
	CONSTRAINT student_info_PK PRIMARY KEY (studID),
    CONSTRAINT student_info_FK FOREIGN KEY (studProgramme) REFERENCES Dev_SE5.list_programmes(programmeID) ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COLLATE=latin1_swedish_ci;


CREATE TABLE Dev_SE5.lecturer_info (
	lectID varchar(100) DEFAULT 'NA' NOT NULL,
	lectName varchar(250) DEFAULT 'NA' NOT NULL,
	lectEmail varchar(250) DEFAULT 'NA' NOT NULL,
	lectTelNum varchar(100) DEFAULT 'NA' NOT NULL,
    school INT DEFAULT -1 NOT NULL,
	CONSTRAINT lecturer_info_PK PRIMARY KEY (lectID),
    CONSTRAINT lecturer_info_FK FOREIGN KEY (school) REFERENCES Dev_SE5.list_school(schoolID) ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COLLATE=latin1_swedish_ci;


CREATE TABLE Dev_SE5.final_projects (
	projectID varchar(100) DEFAULT 'NA' NOT NULL,
	projectName varchar(250) DEFAULT 'NA' NOT NULL,
	projectDetails varchar(500) DEFAULT 'NA' NOT NULL,
	preferenceStudent varchar(250) DEFAULT 'NA' NOT NULL,
	isAvailable tinyint(1) NOT NULL DEFAULT 1,
	attachment BLOB NULL,
	lecturer varchar(100) DEFAULT 'NA' NOT NULL,
	CONSTRAINT final_projects_PK PRIMARY KEY (projectID),
	CONSTRAINT final_projects_UN UNIQUE KEY (projectName),
	CONSTRAINT final_projects_FK FOREIGN KEY (lecturer) REFERENCES Dev_SE5.lecturer_info(lectID) ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COLLATE=latin1_swedish_ci;


CREATE TABLE Dev_SE5.student_project (
	rowID INT auto_increment NOT NULL,
	studID varchar(100) DEFAULT 'NA' NOT NULL,
	projectID varchar(100) DEFAULT 'NA' NOT NULL,
	CONSTRAINT student_project_PK PRIMARY KEY (rowID),
	CONSTRAINT student_project_UN UNIQUE KEY (studID),
	CONSTRAINT student_project_FK FOREIGN KEY (studID) REFERENCES Dev_SE5.student_info(studID) ON UPDATE CASCADE,
	CONSTRAINT student_project_FK_1 FOREIGN KEY (projectID) REFERENCES Dev_SE5.final_projects(projectID) ON UPDATE CASCADE
)
ENGINE=InnoDB
DEFAULT CHARSET=latin1
COLLATE=latin1_swedish_ci;


/* -------------------------------------------------------------------------------------------------------------------------------- */
/* VIEWS */


CREATE VIEW Dev_SE5.view_student_projects AS 
SELECT
	Dev_SE5.student_info.studID AS student_ID,
    Dev_SE5.student_info.studName AS student_Name,
    Dev_SE5.student_info.studEmail AS student_Email,
    Dev_SE5.student_info.studTelNum AS student_Phone,
    Dev_SE5.list_programmes.programmeName AS student_Programme,
    Dev_SE5.list_studyLevel.studyLevelName AS student_Study_Level,
    Dev_SE5.list_school.schoolName AS student_School,
    Dev_SE5.final_projects.projectID AS project_ID,
	Dev_SE5.final_projects.projectName AS project_Title,
    Dev_SE5.final_projects.projectDetails AS project_Details,
    Dev_SE5.final_projects.lecturer AS supervisor_ID,
    Dev_SE5.lecturer_info.lectName AS supervisor_Name,
    Dev_SE5.lecturer_info.lectEmail AS supervisor_Email,
    Dev_SE5.lecturer_info.lectTelNum AS supervisor_Phone,
    (SELECT Dev_SE5.list_school.schoolName FROM Dev_SE5.lecturer_info 
    LEFT OUTER JOIN Dev_SE5.list_school ON Dev_SE5.lecturer_info.school = Dev_SE5.list_school.schoolID
	WHERE Dev_SE5.lecturer_info.lectID = supervisor_ID) AS supervisor_School
FROM 
	Dev_SE5.student_info
LEFT OUTER JOIN Dev_SE5.list_programmes ON Dev_SE5.student_info.studProgramme = Dev_SE5.list_programmes.programmeID
LEFT OUTER JOIN Dev_SE5.list_studyLevel ON Dev_SE5.list_programmes.programmeLevel = Dev_SE5.list_studyLevel.studyLevelID
LEFT OUTER JOIN Dev_SE5.list_school ON Dev_SE5.list_programmes.school = Dev_SE5.list_school.schoolID
LEFT OUTER JOIN Dev_SE5.student_project ON Dev_SE5.student_info.studID = Dev_SE5.student_project.studID
LEFT OUTER JOIN Dev_SE5.final_projects ON Dev_SE5.student_project.projectID = Dev_SE5.final_projects.projectID
LEFT OUTER JOIN Dev_SE5.lecturer_info ON Dev_SE5.final_projects.lecturer = Dev_SE5.lecturer_info.lectID;


CREATE VIEW Dev_SE5.view_projects AS 
SELECT
    Dev_SE5.final_projects.projectID AS project_ID,
	Dev_SE5.final_projects.projectName AS project_Title,
    Dev_SE5.final_projects.projectDetails AS project_Details,
    Dev_SE5.final_projects.preferenceStudent AS preferences,
    Dev_SE5.final_projects.isAvailable AS project_is_available,
    Dev_SE5.lecturer_info.lectName AS supervisor_Name,
    Dev_SE5.lecturer_info.lectEmail AS supervisor_Email,
    Dev_SE5.lecturer_info.lectTelNum AS supervisor_Phone,
    Dev_SE5.list_school.schoolName AS supervisor_School
FROM 
	Dev_SE5.final_projects
LEFT OUTER JOIN Dev_SE5.lecturer_info ON Dev_SE5.final_projects.lecturer = Dev_SE5.lecturer_info.lectID
LEFT OUTER JOIN Dev_SE5.list_school ON Dev_SE5.lecturer_info.school = Dev_SE5.list_school.schoolID;




