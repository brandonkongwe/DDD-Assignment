 -- Task 2, question (a)

CREATE TABLE Branches (
    BranchID number,
    BranchLocation varchar(20),
    CONSTRAINT pk_branches PRIMARY KEY (BranchID)
);

CREATE TABLE TutorAdmin (
    AdminID number,
    BranchID number,
    AdminFirstName varchar(30),
    AdminLastName varchar(30),
    Gender varchar(10),
    AdminPhoneNo number,
    AdminEmail varchar(50),
    CONSTRAINT pk_tutoradmin PRIMARY KEY (AdminID),
    CONSTRAINT fk_tutoradmin_branchid FOREIGN KEY (BranchID)
    	REFERENCES Branches (BranchID)	
);

CREATE TABLE Tutors (
    TutorID varchar(10),
    BranchID number,
    TutFirstName varchar(30),
    TutLastName varchar(30),
    Gender varchar(10),
    TutPhoneNo number,
    TutEmail varchar(50),
    CONSTRAINT pk_tutors PRIMARY KEY (TutorID),
    CONSTRAINT fk_tutors_branchid FOREIGN KEY (BranchID)
    	REFERENCES Branches (BranchID)
);

CREATE TABLE Students (
    StudentID varchar(10),
    BranchID number,
    StudFirstName varchar(30),
    StudLastName varchar(30),
    Age number,
    Gender varchar(10),
    StudPhoneNo number,
    CONSTRAINT pk_students PRIMARY KEY (StudentID),
    CONSTRAINT fk_students_branchid FOREIGN KEY (BranchID)
    	REFERENCES Branches (BranchID)
);

CREATE TABLE Subjects (
    SubjectID number,
    SubjectName varchar(30),
    CONSTRAINT pk_subjects PRIMARY KEY (SubjectID)
);

CREATE TABLE SubTutor (
    TutorID varchar(10),
    SubjectID number,
    CONSTRAINT fk_subtutor_tutorid FOREIGN KEY (TutorID)
        REFERENCES Tutors (TutorID),
    CONSTRAINT fk_subtutor_subjectid FOREIGN KEY (SubjectID)
        REFERENCES Subjects (SubjectID)
);

CREATE TABLE SubStudent (
    StudentID varchar(10),
    SubjectID number,
    CONSTRAINTS fk_substudent_studentid FOREIGN KEY (StudentID)
        REFERENCES Students (StudentID),
    CONSTRAINTS fk_substudent_subjectid FOREIGN KEY (SubjectID)
        REFERENCES Subjects (SubjectID)
);

CREATE TABLE TutorSessions (
    SessionDate date,
    AdminID number,
    SubjectID number,
    StudentID varchar(10),
    TutorID varchar(10),
    TutFirstName varchar(30),
    TutLastName varchar(30),
    StartTime varchar(6),
    EndTime varchar(6),
    CONSTRAINT fk_tutorsessions_adminid FOREIGN KEY (AdminID)
        REFERENCES TutorAdmin (AdminID),
    CONSTRAINT fk_tutorsessions_subjectid FOREIGN KEY (SubjectID)
        REFERENCES Subjects (SubjectID),
    CONSTRAINT fk_tutorsessions_studentid FOREIGN KEY (StudentID)
        REFERENCES Students (StudentID),
    CONSTRAINT fk_tutorsessions_tutorid FOREIGN KEY (TutorID)
        REFERENCES Tutors (TutorID)
);


-- insert values for branches table
INSERT INTO Branches (BranchID, BranchLocation) VALUES (001, 'Gaborone');
INSERT INTO Branches (BranchID, BranchLocation) VALUES (002, 'Francistown');
INSERT INTO Branches (BranchID, BranchLocation) VALUES (003, 'Maun');


-- insert values for tutoradmin table
INSERT INTO TutorAdmin VALUES (011, 001, 'John', 'Tebogo', 'Male', 73456123, 'tebogoj@gmail.com');
INSERT INTO TutorAdmin VALUES (012, 002, 'Lesego', 'Pule', 'Female', 71234568, 'pulel@gmail.com');
INSERT INTO TutorAdmin VALUES (013, 003, 'Cindy', 'Kgosi', 'Female', 73781354, 'kgosic@gmail.com');


-- insert values for tutors table
INSERT INTO Tutors VALUES ('Tut-001', 001, 'Thato', 'Dube', 'Female', 75468321, 'dubet@gmail.com');
INSERT INTO Tutors VALUES ('Tut-002', 001, 'Thuto', 'Lesego', 'Male', 76100233, 'lesegot@gmail.com');
INSERT INTO Tutors VALUES ('Tut-003', 002, 'Brian', 'Katse', 'Male', 73091414, 'katseb@gmail.com');
INSERT INTO Tutors VALUES ('Tut-004', 002, 'Faith', 'Mothupi', 'Female', 77238801, 'mothupif@gmail.com');
INSERT INTO Tutors VALUES ('Tut-005', 003, 'Larona', 'Johnson', 'Female', 77346511, 'johnsonl@gmail.com');
INSERT INTO Tutors VALUES ('Tut-006', 003, 'Kabelo', 'Thuto', 'Male', 71570846, 'thutok@gmail.com');


-- insert values for students table
INSERT INTO Students VALUES ('Gab-001', 001, 'Nthabiseng', 'Pule', 17, 'Female', 74348908);
INSERT INTO Students VALUES ('Gab-002', 001, 'Larona', 'Dinake', 16, 'Female', 73218290);
INSERT INTO Students VALUES ('Gab-003', 001, 'Ben', 'Morapedi', 18, 'Male', 77251209);
INSERT INTO Students VALUES ('Gab-004', 001, 'Losika', 'Matsieng', 12, 'Male', 76603456);
INSERT INTO Students VALUES ('Gab-005', 001, 'Alice', 'Thabiso', 13, 'Female', 73246801); 

INSERT INTO Students VALUES ('Fra-001', 002, 'Oabile', 'Kgokong', 15, 'Male', 72719898);
INSERT INTO Students VALUES ('Fra-002', 002, 'Baone', 'Masike', 18, 'Male', 75634580);
INSERT INTO Students VALUES ('Fra-003', 002, 'Wangu', 'Dikeledi', 17, 'Female', 71347890);
INSERT INTO Students VALUES ('Fra-004', 002, 'Kutlo', 'Ditlhong', 13, 'Male', 76248075);
INSERT INTO Students VALUES ('Fra-005', 002, 'Cindy', 'Kgale', 13, 'Female', 77468034);

INSERT INTO Students VALUES ('Mau-001', 003, 'Eric', 'Pelo', 16, 'Male', 74148093);
INSERT INTO Students VALUES ('Mau-002', 003, 'Katlego', 'Dikgang', 18, 'Female', 73963180);
INSERT INTO Students VALUES ('Mau-003', 003, 'Lisa', 'Maikutlo', 15, 'Female', 77632100);
INSERT INTO Students VALUES ('Mau-004', 003, 'Matthew', 'Mogopodi', 12, 'Male', 77470932);
INSERT INTO Students VALUES ('Mau-005', 003, 'Tshego', 'Mothupi', 13, 'Female', 72896743);


-- insert values for subjects table
INSERT INTO Subjects (SubjectID, SubjectName) VALUES (100, 'Mathematics');
INSERT INTO Subjects (SubjectID, SubjectName) VALUES (101, 'Science');
INSERT INTO Subjects (SubjectID, SubjectName) VALUES (102, 'English');
INSERT INTO Subjects (SubjectID, SubjectName) VALUES (103, 'Setswana');
INSERT INTO Subjects (SubjectID, SubjectName) VALUES (104, 'Information Technology');


-- insert values for subtutor table
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-001', 100);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-001', 101);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-001', 102);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-001', 103);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-001', 104);

INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-002', 100);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-002', 101);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-002', 102);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-002', 103);

INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-003', 100);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-003', 101);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-003', 102);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-003', 103);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-003', 104);

INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-004', 100);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-004', 101);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-004', 102);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-004', 103);

INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-005', 100);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-005', 101);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-005', 102);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-005', 103);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-005', 104);

INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-006', 100);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-006', 101);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-006', 102);
INSERT INTO SubTutor (TutorID, SubjectID) VALUES ('Tut-006', 103);


-- insert values for substudent table
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-001', 100);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-001', 101);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-001', 104);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-002', 100);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-002', 101);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-002', 103);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-003', 101);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-003', 102);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-004', 102);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-004', 103);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-005', 100);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Gab-005', 101);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-001', 100);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-001', 101);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-001', 104);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-002', 101);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-002', 103);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-003', 101);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-003', 102);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-003', 104);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-004', 100);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-004', 101);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-005', 100);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Fra-005', 103);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Mau-001', 100);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Mau-001', 101);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Mau-001', 104);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Mau-002', 100);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Mau-002', 102);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Mau-003', 101);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Mau-003', 102);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Mau-003', 103);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Mau-004', 101);

INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Mau-005', 100);
INSERT INTO SubStudent (StudentID, SubjectID) VALUES ('Mau-005', 102);


-- insert values for tutorsessions table
INSERT INTO TutorSessions VALUES ('11-Jan-2021', 011, 100, 'Gab-001', 'Tut-001', 'Thato', 'Dube', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('11-Jan-2021', 011, 101, 'Gab-001', 'Tut-001', 'Thato', 'Dube', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('12-Jan-2021', 011, 104, 'Gab-001', 'Tut-001', 'Thato', 'Dube', '11:00', '11:30');

INSERT INTO TutorSessions VALUES ('11-Jan-2021', 011, 100, 'Gab-002', 'Tut-001', 'Thato', 'Dube', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('11-Jan-2021', 011, 101, 'Gab-002', 'Tut-001', 'Thato', 'Dube', '14:30', '15:00');
INSERT INTO TutorSessions VALUES ('12-Jan-2021', 011, 103, 'Gab-002', 'Tut-001', 'Thato', 'Dube', '14:00', '14:30');

INSERT INTO TutorSessions VALUES ('13-Jan-2021', 011, 101, 'Gab-003', 'Tut-001', 'Thato', 'Dube', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('13-Jan-2021', 011, 101, 'Gab-003', 'Tut-001', 'Thato', 'Dube', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('14-Jan-2021', 011, 102, 'Gab-003', 'Tut-001', 'Thato', 'Dube', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('14-Jan-2021', 011, 102, 'Gab-003', 'Tut-001', 'Thato', 'Dube', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('11-Feb-2021', 011, 100, 'Gab-001', 'Tut-001', 'Thato', 'Dube', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('11-Feb-2021', 011, 101, 'Gab-001', 'Tut-001', 'Thato', 'Dube', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('12-Feb-2021', 011, 104, 'Gab-001', 'Tut-001', 'Thato', 'Dube', '11:00', '11:30');

INSERT INTO TutorSessions VALUES ('11-Feb-2021', 011, 100, 'Gab-002', 'Tut-001', 'Thato', 'Dube', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('11-Feb-2021', 011, 101, 'Gab-002', 'Tut-001', 'Thato', 'Dube', '14:30', '15:00');
INSERT INTO TutorSessions VALUES ('12-Feb-2021', 011, 103, 'Gab-002', 'Tut-001', 'Thato', 'Dube', '14:00', '14:30');

INSERT INTO TutorSessions VALUES ('13-Feb-2021', 011, 101, 'Gab-003', 'Tut-001', 'Thato', 'Dube', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('13-Feb-2021', 011, 101, 'Gab-003', 'Tut-001', 'Thato', 'Dube', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('14-Feb-2021', 011, 102, 'Gab-003', 'Tut-001', 'Thato', 'Dube', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('14-Feb-2021', 011, 102, 'Gab-003', 'Tut-001', 'Thato', 'Dube', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('14-Jan-2021', 011, 102, 'Gab-004', 'Tut-002', 'Thuto', 'Lesego', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('14-Jan-2021', 011, 102, 'Gab-004', 'Tut-002', 'Thuto', 'Lesego', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('15-Jan-2021', 011, 103, 'Gab-004', 'Tut-002', 'Thuto', 'Lesego', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('15-Jan-2021', 011, 103, 'Gab-004', 'Tut-002', 'Thuto', 'Lesego', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('16-Jan-2021', 011, 100, 'Gab-005', 'Tut-002', 'Thuto', 'Lesego', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('16-Jan-2021', 011, 100, 'Gab-005', 'Tut-002', 'Thuto', 'Lesego', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('17-Jan-2021', 011, 101, 'Gab-005', 'Tut-002', 'Thuto', 'Lesego', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('17-Jan-2021', 011, 101, 'Gab-005', 'Tut-002', 'Thuto', 'Lesego', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('14-Feb-2021', 011, 102, 'Gab-004', 'Tut-002', 'Thuto', 'Lesego', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('14-Feb-2021', 011, 102, 'Gab-004', 'Tut-002', 'Thuto', 'Lesego', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('15-Feb-2021', 011, 103, 'Gab-004', 'Tut-002', 'Thuto', 'Lesego', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('15-Feb-2021', 011, 103, 'Gab-004', 'Tut-002', 'Thuto', 'Lesego', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('16-Feb-2021', 011, 100, 'Gab-005', 'Tut-002', 'Thuto', 'Lesego', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('16-Feb-2021', 011, 100, 'Gab-005', 'Tut-002', 'Thuto', 'Lesego', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('17-Feb-2021', 011, 101, 'Gab-005', 'Tut-002', 'Thuto', 'Lesego', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('17-Feb-2021', 011, 101, 'Gab-005', 'Tut-002', 'Thuto', 'Lesego', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('20-Jan-2021', 012, 100, 'Fra-001', 'Tut-003', 'Brian', 'Katse', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('20-Jan-2021', 012, 101, 'Fra-001', 'Tut-003', 'Brian', 'Katse', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('21-Jan-2021', 012, 104, 'Fra-001', 'Tut-003', 'Brian', 'Katse', '14:00', '14:30');

INSERT INTO TutorSessions VALUES ('22-Jan-2021', 012, 101, 'Fra-002', 'Tut-003', 'Brian', 'Katse', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('22-Jan-2021', 012, 101, 'Fra-002', 'Tut-003', 'Brian', 'Katse', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('23-Jan-2021', 012, 103, 'Fra-002', 'Tut-003', 'Brian', 'Katse', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('23-Jan-2021', 012, 103, 'Fra-002', 'Tut-003', 'Brian', 'Katse', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('25-Jan-2021', 012, 101, 'Fra-003', 'Tut-003', 'Brian', 'Katse', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('25-Jan-2021', 012, 102, 'Fra-003', 'Tut-003', 'Brian', 'Katse', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('25-Jan-2021', 012, 104, 'Fra-003', 'Tut-003', 'Brian', 'Katse', '14:00', '14:30');

INSERT INTO TutorSessions VALUES ('20-Feb-2021', 012, 100, 'Fra-001', 'Tut-003', 'Brian', 'Katse', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('20-Feb-2021', 012, 101, 'Fra-001', 'Tut-003', 'Brian', 'Katse', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('21-Feb-2021', 012, 104, 'Fra-001', 'Tut-003', 'Brian', 'Katse', '14:00', '14:30');

INSERT INTO TutorSessions VALUES ('22-Feb-2021', 012, 101, 'Fra-002', 'Tut-003', 'Brian', 'Katse', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('22-Feb-2021', 012, 101, 'Fra-002', 'Tut-003', 'Brian', 'Katse', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('23-Feb-2021', 012, 103, 'Fra-002', 'Tut-003', 'Brian', 'Katse', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('23-Feb-2021', 012, 103, 'Fra-002', 'Tut-003', 'Brian', 'Katse', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('25-Feb-2021', 012, 101, 'Fra-003', 'Tut-003', 'Brian', 'Katse', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('25-Feb-2021', 012, 102, 'Fra-003', 'Tut-003', 'Brian', 'Katse', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('25-Feb-2021', 012, 104, 'Fra-003', 'Tut-003', 'Brian', 'Katse', '14:00', '14:30');

INSERT INTO TutorSessions VALUES ('27-Jan-2021', 012, 100, 'Fra-004', 'Tut-004', 'Faith', 'Mothupi', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('27-Jan-2021', 012, 100, 'Fra-004', 'Tut-004', 'Faith', 'Mothupi', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('28-Jan-2021', 012, 101, 'Fra-004', 'Tut-004', 'Faith', 'Mothupi', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('28-Jan-2021', 012, 101, 'Fra-004', 'Tut-004', 'Faith', 'Mothupi', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('29-Jan-2021', 012, 100, 'Fra-005', 'Tut-004', 'Faith', 'Mothupi', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('29-Jan-2021', 012, 100, 'Fra-005', 'Tut-004', 'Faith', 'Mothupi', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('30-Jan-2021', 012, 103, 'Fra-005', 'Tut-004', 'Faith', 'Mothupi', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('30-Jan-2021', 012, 103, 'Fra-005', 'Tut-004', 'Faith', 'Mothupi', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('23-Feb-2021', 012, 100, 'Fra-004', 'Tut-004', 'Faith', 'Mothupi', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('23-Feb-2021', 012, 100, 'Fra-004', 'Tut-004', 'Faith', 'Mothupi', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('24-Feb-2021', 012, 101, 'Fra-004', 'Tut-004', 'Faith', 'Mothupi', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('24-Feb-2021', 012, 101, 'Fra-004', 'Tut-004', 'Faith', 'Mothupi', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('25-Feb-2021', 012, 100, 'Fra-005', 'Tut-004', 'Faith', 'Mothupi', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('25-Feb-2021', 012, 100, 'Fra-005', 'Tut-004', 'Faith', 'Mothupi', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('26-Feb-2021', 012, 103, 'Fra-005', 'Tut-004', 'Faith', 'Mothupi', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('26-Feb-2021', 012, 103, 'Fra-005', 'Tut-004', 'Faith', 'Mothupi', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('11-Jan-2021', 013, 100, 'Mau-001', 'Tut-005', 'Larona', 'Johnson', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('11-Jan-2021', 013, 101, 'Mau-001', 'Tut-005', 'Larona', 'Johnson', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('12-Jan-2021', 013, 104, 'Mau-001', 'Tut-005', 'Larona', 'Johnson', '14:00', '14:30');

INSERT INTO TutorSessions VALUES ('13-Jan-2021', 013, 100, 'Mau-002', 'Tut-005', 'Larona', 'Johnson', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('13-Jan-2021', 013, 100, 'Mau-002', 'Tut-005', 'Larona', 'Johnson', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('14-Jan-2021', 013, 102, 'Mau-002', 'Tut-005', 'Larona', 'Johnson', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('14-Jan-2021', 013, 102, 'Mau-002', 'Tut-005', 'Larona', 'Johnson', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('15-Jan-2021', 013, 101, 'Mau-003', 'Tut-005', 'Larona', 'Johnson', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('15-Jan-2021', 013, 102, 'Mau-003', 'Tut-005', 'Larona', 'Johnson', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('15-Jan-2021', 013, 103, 'Mau-003', 'Tut-005', 'Larona', 'Johnson', '14:00', '14:30');

INSERT INTO TutorSessions VALUES ('11-Feb-2021', 013, 100, 'Mau-001', 'Tut-005', 'Larona', 'Johnson', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('11-Feb-2021', 013, 101, 'Mau-001', 'Tut-005', 'Larona', 'Johnson', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('12-Feb-2021', 013, 104, 'Mau-001', 'Tut-005', 'Larona', 'Johnson', '14:00', '14:30');

INSERT INTO TutorSessions VALUES ('13-Feb-2021', 013, 100, 'Mau-002', 'Tut-005', 'Larona', 'Johnson', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('13-Feb-2021', 013, 100, 'Mau-002', 'Tut-005', 'Larona', 'Johnson', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('14-Feb-2021', 013, 102, 'Mau-002', 'Tut-005', 'Larona', 'Johnson', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('14-Feb-2021', 013, 102, 'Mau-002', 'Tut-005', 'Larona', 'Johnson', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('15-Feb-2021', 013, 101, 'Mau-003', 'Tut-005', 'Larona', 'Johnson', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('15-Feb-2021', 013, 102, 'Mau-003', 'Tut-005', 'Larona', 'Johnson', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('15-Feb-2021', 013, 103, 'Mau-003', 'Tut-005', 'Larona', 'Johnson', '14:00', '14:30');

INSERT INTO TutorSessions VALUES ('18-Jan-2021', 013, 101, 'Mau-004', 'Tut-006', 'Kabelo', 'Thuto', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('18-Jan-2021', 013, 101, 'Mau-004', 'Tut-006', 'Kabelo', 'Thuto', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('19-Jan-2021', 013, 101, 'Mau-004', 'Tut-006', 'Kabelo', 'Thuto', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('19-Jan-2021', 013, 101, 'Mau-004', 'Tut-006', 'Kabelo', 'Thuto', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('20-Jan-2021', 013, 100, 'Mau-005', 'Tut-006', 'Kabelo', 'Thuto', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('20-Jan-2021', 013, 100, 'Mau-005', 'Tut-006', 'Kabelo', 'Thuto', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('21-Jan-2021', 013, 102, 'Mau-005', 'Tut-006', 'Kabelo', 'Thuto', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('21-Jan-2021', 013, 102, 'Mau-005', 'Tut-006', 'Kabelo', 'Thuto', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('18-Feb-2021', 013, 101, 'Mau-004', 'Tut-006', 'Kabelo', 'Thuto', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('18-Feb-2021', 013, 101, 'Mau-004', 'Tut-006', 'Kabelo', 'Thuto', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('19-Feb-2021', 013, 101, 'Mau-004', 'Tut-006', 'Kabelo', 'Thuto', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('19-Feb-2021', 013, 101, 'Mau-004', 'Tut-006', 'Kabelo', 'Thuto', '14:30', '15:00');

INSERT INTO TutorSessions VALUES ('20-Feb-2021', 013, 100, 'Mau-005', 'Tut-006', 'Kabelo', 'Thuto', '11:00', '11:30');
INSERT INTO TutorSessions VALUES ('20-Feb-2021', 013, 100, 'Mau-005', 'Tut-006', 'Kabelo', 'Thuto', '11:30', '12:00');
INSERT INTO TutorSessions VALUES ('21-Feb-2021', 013, 102, 'Mau-005', 'Tut-006', 'Kabelo', 'Thuto', '14:00', '14:30');
INSERT INTO TutorSessions VALUES ('21-Feb-2021', 013, 102, 'Mau-005', 'Tut-006', 'Kabelo', 'Thuto', '14:30', '15:00');


-- task 2, question b(i)

-- making phone numbers not null in the tutoradmin table
ALTER TABLE TutorAdmin
MODIFY AdminPhoneNo number NOT NULL;

-- check constraint for checking phone number format in tutoradmin table
ALTER TABLE TutorAdmin
ADD CONSTRAINT ck_adminphonenumformat CHECK (REGEXP_LIKE(AdminPhoneNo, '[7][1-7][0-9][0-9][0-9][0-9][0-9][0-9]'));

-- check constraint for checking phone number length in tutoradmin table
ALTER TABLE TutorAdmin
ADD CONSTRAINT ck_adminphonenumlength CHECK (LENGTH(AdminPhoneNo) = 8);

-- making phone numbers not null in the tutors table
ALTER TABLE Tutors
MODIFY TutPhoneNo number NOT NULL;

-- check constraint for checking phone number format in tutors table
ALTER TABLE Tutors
ADD CONSTRAINT ck_tutphonenumformat CHECK (REGEXP_LIKE(TutPhoneNo, '[7][1-7][0-9][0-9][0-9][0-9][0-9][0-9]'));

-- check constraint for checking phone number length in tutors table
ALTER TABLE Tutors
ADD CONSTRAINT ck_tutphonenumlength CHECK (LENGTH(TutPhoneNo) = 8);

-- making phone numbers not null in the students table
ALTER TABLE Students
MODIFY StudPhoneNo number NOT NULL;

-- check constraint for checking phone number format in students table
ALTER TABLE Students
ADD CONSTRAINT ck_studphonenumformat CHECK (REGEXP_LIKE(StudPhoneNo, '[7][1-7][0-9][0-9][0-9][0-9][0-9][0-9]'));

-- check constraint for checking phone number length in students table
ALTER TABLE Students
ADD CONSTRAINT ck_studphonenumlength CHECK (LENGTH(StudPhoneNo) = 8);

-- task 2, question b(ii)

ALTER TABLE Students
ADD CONSTRAINT ck_studentage CHECK (Age BETWEEN 12 AND 18);

-- task 2, question b(iii)

-- unique constraint for admin email
ALTER TABLE TutorAdmin
ADD CONSTRAINT uc_admin_email UNIQUE (AdminEmail);

-- unique constraint for tutor email
ALTER TABLE Tutors
ADD CONSTRAINT uc_tutor_email UNIQUE (TutEmail);

-- task 2, question c(i)

SELECT Tutors.TutorID, COUNT(TutorSessions.TutorID) AS Number_of_Sessions_Scheduled
FROM Tutors, TutorSessions
WHERE Tutors.TutorID = TutorSessions.TutorID
GROUP BY Tutors.TutorID
ORDER BY Tutors.TutorID ASC;

-- task 2, question c(ii)

SELECT TutFirstName, TutLastName
FROM TutorSessions
GROUP BY TutFirstName, TutLastName
HAVING COUNT (TutorID) < 4
ORDER BY TutFirstName ASC;

-- task 2, question c(iii)

SELECT Branches.BranchLocation, COUNT(Students.StudentID) AS Number_of_Students
FROM Branches, Students
WHERE Branches.BranchID = Students.BranchID
GROUP BY Branches.BranchLocation;


-- task 2, question c(iv)

SELECT AVG(Age) AS Average_Age_of_Students FROM Students;

-- task 2, question c(v)  

SELECT Students.StudFirstName, Students.StudLastName
FROM Students, SubStudent
WHERE Students.StudentID = SubStudent.StudentID
GROUP BY StudFirstName, StudLastName
HAVING COUNT (SubStudent.StudentID) = 2
ORDER BY Students.StudFirstName ASC;

-- task 2, question d(i)

CREATE OR REPLACE PROCEDURE listStudentSessions
IS
st_id varchar(10);
st_fname varchar(30);
st_lname varchar(30);
num_of_sessions number;
total_hours number;
CURSOR c_liststudent IS 
      SELECT Students.StudentID, Students.StudFirstName, Students.StudLastName, COUNT(TutorSessions.StudentID) 
      FROM Students, TutorSessions
      WHERE Students.StudentID = TutorSessions.StudentID AND TutorSessions.SessionDate BETWEEN '01-Jan-2021' AND '31-Jan-2021'
      GROUP BY Students.StudentID, Students.StudFirstName, Students.StudLastName
      ORDER BY Students.StudentID ASC; 
BEGIN
    OPEN c_liststudent;
    LOOP
        FETCH c_liststudent INTO st_id, st_fname, st_lname, num_of_sessions;
            EXIT WHEN c_liststudent%notfound;

        total_hours := (num_of_sessions * 30) / 60;
        
        dbms_output.put_line('StudentID: ' || st_id);
        dbms_output.put_line('First Name: ' || st_fname);
        dbms_output.put_line('Last Name: ' || st_lname);
        dbms_output.put_line('Number of sessions per month: ' || num_of_sessions);
        dbms_output.put_line('Total Hours of sessions per month: ' || total_hours);
    END LOOP;
    CLOSE c_liststudent;
END;


-- task 2, question d(ii)

CREATE OR REPLACE TRIGGER TutorSessionLimit
BEFORE INSERT OR UPDATE
ON TutorSessions
DECLARE
    num_of_sessions number;
BEGIN 
    SELECT COUNT(TutorID)
    INTO num_of_sessions
    FROM TutorSessions;
    
    IF num_of_sessions > 40 THEN
        RAISE_APPLICATION_ERROR(-20115, 'Maximum number of allowed work hours reached');
    END IF;
END;


-- task 2, question (f)

DECLARE
branch_name branches.branchlocation%type;
num_of_tutors number;
CURSOR c_listtutors IS 
      SELECT Branches.BranchLocation, COUNT(TutorID)
      FROM Branches, Tutors
      WHERE Branches.BranchID = Tutors.BranchID
      GROUP BY Branches.BranchLocation;
BEGIN
    OPEN c_listtutors;
    LOOP
        FETCH c_listtutors INTO branch_name, num_of_tutors;
            EXIT WHEN c_listtutors%notfound;

        dbms_output.put_line('Branch Name: ' || branch_name);
        dbms_output.put_line('Number of tutors: ' || num_of_tutors);
    END LOOP;
    CLOSE c_listtutors;
END;

-- task 2, question d(ii) (second)

CREATE OR REPLACE TRIGGER TutorSessionLimit
BEFORE INSERT OR UPDATE
ON TutorSessions
DECLARE
    num_of_sessions number;
CURSOR c_sessionlimit IS 
      SELECT COUNT(TutorSessions.TutorID)
      FROM Tutors, TutorSessions
      WHERE Tutors.TutorID = TutorSessions.TutorID
      GROUP BY Tutors.TutorID;
BEGIN
    OPEN c_sessionlimit;
    LOOP
        FETCH c_sessionlimit INTO num_of_sessions;
            EXIT WHEN c_sessionlimit%notfound;
    
    
    IF num_of_sessions > 40 THEN
        RAISE_APPLICATION_ERROR(-20115, 'Maximum number of allowed work hours reached');
    END IF;
    END LOOP;
    CLOSE c_sessionlimit;
END;