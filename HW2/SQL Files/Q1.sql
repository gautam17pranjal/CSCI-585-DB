/* DATABASE: postgresSQL */


CREATE TABLE EMPLOYEE (
	Emp_ID INT NOT NULL,
	Emp_Name varchar(255) NOT NULL,
	Floor_Num INT NOT NULL,
	Phone_Num INT NOT NULL,
	EMAIL varchar(255) NOT NULL,
	Address varchar(255) NOT NULL,
	PRIMARY KEY (Emp_ID),
	CHECK(Emp_ID > 0 AND
		 Floor_Num >= 1 AND 
		 Floor_Num <=10)
);

CREATE TABLE MEETING (
	Meeting_ID INT NOT NULL,
	Emp_ID INT NOT NULL,
	Room_num INT NOT NULL,
	Meeting_Start_Time INT NOT NULL,
	PRIMARY KEY (Meeting_ID, Emp_ID),
	FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
	CHECK(Meeting_Start_Time <= 23 AND 
		  Meeting_Start_Time >= 0 AND 
		  Room_num > 0 AND 
		  Meeting_ID > 0)
);


CREATE TABLE NOTIFICATION (
	Notification_ID INT NOT NULL,
	Emp_ID INT NOT NULL,
	Notification_Date DATE NOT NULL,
	Notification_Type varchar(255) NOT NULL,
	PRIMARY KEY (Notification_ID),
	FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
	CHECK(Notification_ID > 0)
);

CREATE TABLE SYMPTOM (
	Row_ID INT NOT NULL,
	Emp_ID INT NOT NULL,
	Date_Reported DATE NOT NULL,
	Symptom_ID INT NOT NULL,
	PRIMARY KEY (Row_ID),
	FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
	CHECK(Row_ID >= 0 AND
		 Symptom_ID >= 1 AND
		 Symptom_ID <= 5)
);

CREATE TABLE SCAN (
	Scan_ID INT NOT NULL,
	Emp_ID INT NOT NULL,
	Scan_Date DATE NOT NULL,
	Scan_Time INT NOT NULL,
	Temperature FLOAT(2) NOT NULL,
	PRIMARY KEY (Scan_ID),
	FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
	CHECK(Scan_ID >= 0)
);

CREATE TABLE TEST (
	Test_ID INT NOT NULL,
	Emp_ID INT NOT NULL,
	Test_Location varchar(255) NOT NULL,
	Test_Date DATE NOT NULL,
	Test_Time INT NOT NULL,
	Test_Result varchar(255) NOT NULL,
	PRIMARY KEY (Test_ID),
	FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
	CHECK(Test_ID >= 0 AND
		 Test_Time >= 0 AND
		 Test_Time <= 23 AND
		 Test_Result = 'Positive' or 
		 Test_Result = 'Negative')
);

CREATE TABLE POSITIVE_CASE (
	Case_ID INT NOT NULL,
	Emp_ID INT NOT NULL,
	Case_Date DATE NOT NULL,
	Resolution varchar(255) NOT NULL,
	PRIMARY KEY (Case_ID),
	FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
	CHECK(Case_ID >= 0)
);

CREATE TABLE HEALTH_STATUS (
	Health_ID INT NOT NULL,
	Emp_ID INT NOT NULL,
	Emp_Self_Report_Date DATE NOT NULL,
	Status varchar(255) NOT NULL,
	PRIMARY KEY (Health_ID),
	FOREIGN KEY (Emp_ID) REFERENCES Employee(Emp_ID),
	CHECK(Health_ID >= 0 AND
		  Status = 'Sick' OR 
		  Status = 'Hospitalized' OR 
		  Status = 'Well')
);

INSERT INTO EMPLOYEE (Emp_ID, Emp_Name, Floor_Num, Phone_Num, Email, Address)
VALUES 
(1, 'Taj Upton', 1, 123456789, 'tajupt@company.com', 'Apt1'),
(2, 'Marinella Hendrix', 2, 234567890, 'marhen@company.com', 'Apt2'),
(3, 'Maximilian Aras', 3, 345678901, 'maxaras@company.com', 'Apt3'),
(4, 'Taika Mervi', 4, 456789012, 'taimervi@company.com', 'Apt4'),
(5, 'Alfbern Mirce', 5, 138300303, 'alfmirce@company.com', 'Apt5'),
(6, 'Cory Henry', 6, 906610953, 'coryhen@company.com', 'Apt6'),
(7, 'Caroline Wong', 7, 881820389, 'carwong@company.com', 'Apt7'),
(8, 'Simon Cortez', 8, 537041634, 'simcort@company.com', 'Apt8'),
(9, 'Jeremy Schwartz', 9, 614810260, 'jersch@company.com', 'Apt9'),
(10, 'Jody Briggs', 10, 135959995, 'jodbrigg@company.com', 'Apt10'),
(11, 'Arthur Copeland', 1, 597028321, 'arthcope@company.com', 'Apt11'),
(12, 'Philip King', 2, 908579731, 'philking@company.com', 'Apt12'),
(13, 'Alvin Gonzales', 3, 668221850, 'alvingonz@company.com', 'Apt13'),
(14, 'Beverly Mullins', 4, 449657989, 'bevmull@company.com', 'Apt14'),
(15, 'Camille Frazier', 5, 120109694, 'camfraz@company.com', 'Apt15'),
(16, 'Brandi Curtis', 6, 508474013, 'brancur@company.com', 'Apt16'),
(17, 'Dewey Ingram', 7, 760772149, 'dewing@company.com', 'Apt17'),
(18, 'Jaime Lyons', 8, 998292407, 'jailyons@company.com', 'Apt18'),
(19, 'Teresa Webster', 9, 284560563, 'terwebste@company.com', 'Apt19'),
(20, 'Sally Patrick', 10, 158269811, 'salpatr@company.com', 'Apt20'),
(21, 'Erin Reeves', 1, 337920948, 'erinreev@company.com', 'Apt21'),
(22, 'Dexter Ortega', 2, 642461184, 'dextorte@company.com', 'Apt22'),
(23, 'Krista Horton', 3, 107253438, 'krishort@company.com', 'Apt23'),
(24, 'Otis Bridges', 4, 455783083, 'otisbridge@company.com', 'Apt24'),
(25, 'Mandy Taylor', 5, 369623121, 'mantayl@company.com', 'Apt25'),
(26, 'Alicia Francis', 6, 892857470, 'alicifis@company.com', 'Apt26'),
(27, 'Martin Page', 7, 616969703, 'martipage@company.com', 'Apt27'),
(28, 'May Perez', 8, 189783201, 'mayperez@company.com', 'Apt28'),
(29, 'Darlene Pittman', 9, 113209181, 'darlpitt@company.com', 'Apt29'),
(30, 'Wendell Clarke', 10, 234915648, 'wende@company.com', 'Apt30');


INSERT INTO MEETING (Meeting_ID, Emp_ID, Room_Num, Meeting_Start_time)
VALUES 
(1, 1, 1, 8),
(2, 2, 2, 10),
(3, 3, 3, 12),
(4, 4, 4, 14),
(5, 5, 5, 16),
(1, 6, 1, 8),
(2, 7, 2, 10),
(3, 8, 3, 12),
(4, 9, 4, 14),
(5, 10, 5, 16),
(1, 11, 1, 8),
(2, 12, 2, 10),
(3, 13, 3, 12),
(4, 14, 4, 14),
(5, 15, 5, 16),
(1, 16, 1, 8),
(2, 17, 2, 10),
(3, 18, 3, 12),
(4, 19, 4, 14),
(5, 20, 5, 16);


INSERT INTO SCAN(Scan_ID, Emp_ID, Scan_Date, Scan_Time, Temperature)
VALUES
(1, 1, '2021-10-01', 8, 99),
(2, 3, '2021-10-02', 9, 100),
(3, 5, '2021-10-03', 10, 99.1),
(4, 7, '2021-10-01', 17, 100.2),
(5, 9, '2021-10-02', 18, 98),
(6, 2, '2021-10-03', 19, 98.6),
(7, 4, '2021-10-04', 8, 98.3),
(8, 6, '2021-10-05', 9, 99.2),
(9, 8, '2021-10-06', 10, 99.9),
(10, 10, '2021-10-04', 17, 98.1),
(11, 3, '2021-10-05', 18, 98.7),
(12, 5, '2021-10-06', 19, 99.1),
(13, 7, '2021-10-07', 8, 99.2),
(14, 6, '2021-10-08', 9, 99.3),
(15, 8, '2021-10-09', 10, 98.2),
(16, 10, '2021-10-07', 18, 98.3),
(17, 15, '2021-10-08', 19, 98.4),
(18, 22, '2021-10-09', 20, 98.5),
(19, 25, '2021-10-10', 9, 98.2),
(20, 20, '2021-10-10', 10, 98.4);




INSERT INTO SYMPTOM(ROW_ID, Emp_ID, Date_Reported, Symptom_ID)
VALUES
(1, 1, '2021-10-01', 1),
(2, 3, '2021-10-02', 2),
(3, 5, '2021-10-03', 3),
(4, 7, '2021-10-04', 4),
(5, 9, '2021-10-05', 5),
(6, 11, '2021-10-06', 1),
(7, 13, '2021-10-07', 2),
(8, 15, '2021-10-08', 3),
(9, 17, '2021-10-09', 4),
(10, 19, '2021-10-10', 5),
(11, 21, '2021-10-11', 1),
(12, 30, '2021-10-12', 2),
(13, 2, '2021-10-13', 3),
(14, 4, '2021-10-14', 4),
(15, 6, '2021-10-15', 5),
(16, 8, '2021-10-16', 1),
(17, 10, '2021-10-17', 1),
(18, 12, '2021-10-18', 1);


INSERT INTO TEST(Test_ID, Emp_ID, Test_Location, Test_Date, Test_Time, Test_Result)
VALUES
(1, 1, 'Company', '2021-10-11', 8, 'Positive'),
(2, 2, 'Hospital', '2021-10-12', 9, 'Negative'),
(3, 3, 'Clinic', '2021-10-13', 10, 'Negative'),
(4, 4, 'Company', '2021-10-14', 11, 'Negative'),
(5, 5, 'Hospital', '2021-10-15', 8, 'Negative'),
(6, 6, 'Clinic', '2021-10-16', 9, 'Negative'),
(7, 7, 'Clinic', '2021-10-17', 10, 'Negative'),
(8, 8, 'Clinic', '2021-10-18', 11, 'Positive'),
(9, 9, 'Company', '2021-10-19', 8, 'Positive'),
(10, 10, 'Hospital', '2021-10-20', 9, 'Positive'),
(11, 11, 'Clinic', '2021-10-21', 10, 'Negative'),
(12, 12, 'Company', '2021-10-22', 11, 'Negative'),
(13, 13, 'Company', '2021-10-23', 12, 'Negative'),
(14, 14, 'Hospital', '2021-10-24', 12, 'Positive'),
(15, 15, 'Clinic', '2021-10-25', 9, 'Negative'),
(16, 16, 'Clinic', '2021-10-26', 9, 'Positive'),
(17, 17, 'Hospital', '2021-10-27', 10, 'Negative'),
(18, 18, 'Company', '2021-10-11', 8, 'Positive'),
(19, 19, 'Company', '2021-10-12', 8, 'Positive'),
(20, 20, 'Company', '2021-10-13', 8, 'Positive'),
(21, 21, 'Company', '2021-10-14', 8, 'Positive'),
(22, 22, 'Company', '2021-10-15', 8, 'Positive');


INSERT INTO HEALTH_STATUS(Health_ID, Emp_ID, Emp_Self_Report_Date, Status)
VALUES
(1, 1, '2021-10-25', 'Well'),
(2, 8, '2021-10-30', 'Well'),
(3, 9, '2021-10-29', 'Well'),
(4, 10, '2021-10-31', 'Sick'),
(5, 14, '2021-10-31', 'Hospitalized'),
(6, 16, '2021-10-31', 'Sick'),
(7, 18, '2021-10-25', 'Well'),
(8, 19, '2021-10-26', 'Well'),
(9, 20, '2021-10-27', 'Hospitalized'),
(10, 21, '2021-10-28', 'Hospitalized'),
(11, 22, '2021-10-29', 'Well'),
(12, 20, '2021-10-25', 'Sick'),
(13, 30, '2021-10-30', 'Sick'),
(14, 15, '2021-10-29', 'Sick');



INSERT INTO Positive_Case(Case_ID, Emp_ID, Case_Date, Resolution)
VALUES
(1, 1, '2021-10-25', 'Back to work'),
(2, 8, '2021-10-30', 'Back to work'),
(3, 9, '2021-10-29', 'Left the company'), 
(4, 10, '2021-10-31', 'Still Sick'), 
(5, 14, '2021-10-31', 'Still in Hospital'), 
(6, 16, '2021-10-31', 'Still Sick'), 
(7, 18, '2021-10-25', 'Back to work'), 
(8, 19, '2021-10-26', 'Back to work'), 
(9, 20, '2021-10-27', 'Deceased'), 
(10, 21, '2021-10-28', 'Deceased'),
(11, 22, '2021-10-30', 'Left the company');


INSERT INTO Notification(Notification_ID, Emp_ID, Notification_Date, Notification_Type)
VALUES
(1, 6, '2021-10-11', 'Mandatory'),
(2, 11, '2021-10-11', 'Mandatory'),
(3, 2, '2021-10-13', 'Mandatory'),
(4, 7, '2021-10-14', 'Mandatory'),
(5, 12, '2021-10-15', 'Mandatory'),
(6, 17, '2021-10-18', 'Mandatory'),
(7, 3, '2021-10-20', 'Mandatory'),
(8, 13, '2021-10-11', 'Mandatory'),
(9, 4, '2021-10-19', 'Mandatory'),
(10, 5, '2021-10-13', 'Mandatory'),
(11, 15, '2021-10-13', 'Mandatory'),
(12, 16, '2021-10-11', 'Mandatory'),
(13, 17, '2021-10-25', 'Mandatory'),
(14, 18, '2021-10-21', 'Mandatory'),
(15, 19, '2021-10-22', 'Mandatory'),
(16, 20, '2021-10-30', 'Mandatory'),
(17, 8, '2021-10-11', 'Mandatory'),
(18, 9, '2021-10-25', 'Mandatory'),
(19, 10, '2021-10-21', 'Mandatory'),
(20, 14, '2021-10-22', 'Mandatory'),
(21, 21, '2021-10-11', 'Optional'),
(22, 22, '2021-10-11', 'Optional'),
(23, 23, '2021-10-13', 'Optional'),
(24, 24, '2021-10-14', 'Optional'),
(25, 25, '2021-10-15', 'Optional'),
(26, 26, '2021-10-18', 'Optional'),
(27, 27, '2021-10-20', 'Optional'),
(28, 28, '2021-10-11', 'Optional'),
(29, 29, '2021-10-19', 'Optional'),
(30, 30, '2021-10-13', 'Optional');

















