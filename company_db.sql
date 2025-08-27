show databases;
-- drop the existing database
DROP DATABASE IF EXISTS company_db;
-- recreate the database
CREATE DATABASE IF NOT EXISTS company_db;
-- select the database as the current context
USE company_db;
-- create the department table
CREATE TABLE Department (
acronym VARCHAR(6),
dept_name VARCHAR(60) NOT NULL,
PRIMARY KEY (acronym)
);
-- create the employee table
CREATE TABLE Employee (
registration INT PRIMARY KEY NOT NULL,
SSN VARCHAR(11) UNIQUE,
empl_name VARCHAR(60) NOT NULL,
address VARCHAR(100),
-- note that this attribute has the N as default. If a value is not
-- provided, we assume it is neutral/non-binary
gender ENUM("M", "F", "N") NOT NULL DEFAULT "N",
dob DATE,
salary DECIMAL(12, 2) NOT NULL,
department VARCHAR(6),
supervisor INT NOT NULL,
FOREIGN KEY (supervisor)
REFERENCES Employee (registration),
FOREIGN KEY (department)
REFERENCES Department (acronym)
);
-- create the project table
CREATE TABLE IF NOT EXISTS Project (
proj_number INT PRIMARY KEY NOT NULL,
proj_name VARCHAR(50) NOT NULL,
location VARCHAR(50),
department VARCHAR(6),
UNIQUE (proj_name),
FOREIGN KEY (department)
REFERENCES department (acronym)
);
-- create the dependent table
CREATE TABLE IF NOT EXISTS Dependent (
depend_name VARCHAR(50) NOT NULL,
-- note that this attribute has child as the default. If a value is not
-- provided, we assume it is child
relationship ENUM("parent", "child", "spouse") NOT NULL DEFAULT "child",
-- note that this attribute has the N as default. If a value is not
-- provided, we assume it is neutral/non-binary
gender ENUM("M", "F", "N") NOT NULL DEFAULT "N",
dob DATE,
employee INT NOT NULL,
CONSTRAINT pk_dependent PRIMARY KEY (depend_name , employee),
CONSTRAINT fk_employee FOREIGN KEY (employee)
REFERENCES Employee (registration)
ON DELETE CASCADE
);
-- show all the tables in the database
-- SHOW TABLES;
-- shows the structure of the created table
-- uncomment these lines if you need to see the result
-- DESC Department;
-- DESC Employee;
-- DESC Project;
-- DESC Dependent;
-- ----------------------------------------------------------------------------
-- DML Script: the INSERT statement
-- ----------------------------------------------------------------------------
--
-- DEPARTMENT table
--
INSERT INTO Department VALUES
("HRD", "Human Resources Department"),
("FD", "Finances Department"),
("SD", "Sales Department"),
("PMD", "Project Management Department");
--
-- EMPLOYEE table
--
INSERT INTO Employee VALUES
(123, 29388475678, "Wendy Darling", "234 N Nowhere Dr", "F",
"1970-12-12", 300000.00, "HRD", 123),
(111, 64473829029, "Peter Pan", "74 E Neverland Road", "M",
"1980-02-08", 220000.00, "HRD", 123),
(145, 83392019876, "James Hook", "234 N Nowhere Dr", "M",
"1979-08-10", 180000.00, "HRD", 123),
(132, 3948278490, "John Darling", "234 N Nowhere Dr", "N",
"1986-06-08", 250000.00, "FD", 111),
(182, 84933092837, "Michael Darling", "234 N Nowhere Dr", "N",
"1975-03-04", 180000.00, "FD", 182),
(164, 29098478930, "Mary Darling", "234 N Nowhere Dr", "F",
"1980-09-08", 150000.00, "FD", 182),
(116, 78584783904, "Kaw Chief", "23 Indian Camp Road", "M",
"1980-12-28", 28000.00, "FD", 182),
(173, 46776467892, "Tinker Bell", "74 E Neverland Road", "N",
"1970-09-08", 40000.00, "FD", 173),
(125, 27783782903, "George Darling", "234 N Nowhere Dr", "M",
"1982-10-18", 100000.00, "FD", 173),
(234, 10092837489, "Tiger Lily", "23 Indian Camp Road", "F",
"1970-08-02", 35000.00, "PMD", 234),
(188, 439098392, "Jiminy Cricket", "Rua B", "N", "1981-02-01",
40000.00, "PMD", 234),
(192, 22789838902, "Geppetto", "935 Tuscan Village Road", "M",
"1975-11-28", 25000.00, "PMD", 234),
(184, 77483983746, "Esmeralda Agnes", "85 S Notre-Dame Dr", "N",
"1980-12-20", 30000.00, "SD", 184),
(155, 1929109867, "Claude Frollo", "123 N Notre-Dame Dr", "M",
"1983-06-22", 23000.00, "SD", 192),
(197, 92099261758, "Clopin Trouillefou", "573 N Notre-Dame Dr", "N",
"1979-03-29", 28000.00, "SD", 192),
(167, 12212953790, "Mulan Zhou", "94 S Xiaochun Road", "F",
"1985-05-10", 40000.00, "SD", 192),
(122, 77433290182, "Li Shang", "94 S Xiaochun Road", "M",
"1972-11-05", 28000.00, "FD", 122),
(135, 22290926785, "Hua Li", "93 S Xiaochun Road", "F",
"1985-02-28", 22300.00, "FD", 122),
(136, 11526783327, "Maribel Madrigal", "857 W Enchanted Drive", "F",
"1976-04-19", 18000.00, "FD", 122),
(172, 88291309220, "Mariano Guzman", "56 W Enchanted Drive", "M",
"1986-02-27", 90000.00, "FD", 135);
--
-- PROJECT table
--
INSERT INTO Project VALUES
(1782, "Sales reestructure", "Neverland", "SD"),
(1732, "Sales accounting", "Neverland", "SD"),
(1952, "FD and SD Integration", "London", "FD"),
(1934, "Profit management", "London", "FD"),
(1455, "Accounting sector reestructure", "Paris", "FD"),
(1832, "Sales sector professional development", "Tuscany", "HRD"),
(1820, "Youth carreer development program", "Tuscany", "HRD"),
(1339, "Sales market redefinition", "London", "PMD"),
(1396, "Management integration program", "Paris", "PMD");
--
-- DEPENDENT table
--
INSERT INTO Dependent VALUES
("Danielle", "spouse", "F", "1979-09-10", 111),
("David", "child", "M", "2001-01-28", 136),
("Isadora", "child", "F", "2003-09-01", 136),
("Smee", "spouse", "N", "1075-12-19", 173),
("Nance", "parent", "N", "1958-10-17", 125);

CREATE USER 'CS345'@'localhost' IDENTIFIED BY '6085743';

GRANT ALL ON company_db TO 'CS345'@'localhost'; 
--
-- end of script
--
