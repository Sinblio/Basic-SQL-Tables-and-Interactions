create database p1;
use p1;

CREATE TABLE students (
    snum INTEGER,
    ssn INTEGER,
    name VARCHAR(10),
    gender VARCHAR(1),
    dob DATETIME,
    c_addr VARCHAR(20),
    c_phone VARCHAR(10),
    p_addr VARCHAR(20),
    p_phone VARCHAR(10),
    PRIMARY KEY (ssn),
    UNIQUE (snum)
);

CREATE TABLE Departments (
    code INTEGER,
    name VARCHAR(50),
    phone VARCHAR(10),
    college VARCHAR(20),
    PRIMARY KEY (code),
    UNIQUE (name)
);

create table Degrees (
	name varchar(50),
    level varchar(5),
    department_code integer,
    primary key (name, level),
    foreign key (department_code) references Departments(code)
);

create table Courses (
	number integer,
    name varchar(50),
    description varchar(50),
    credithours integer,
    level varchar(20),
    department_code integer,
    primary key (number),
    unique (name),
    foreign key (department_code) references Departments(code)
);

create table Register (
	snum integer,
    course_number integer,
    regtime varchar(20),
    grade integer,
    primary key (snum, course_number),
    foreign key (snum) references Students(snum),
    foreign key (course_number) references Courses(number)
);

create table Major (
	snum integer,
    name varchar(50),
    level varchar(5),
    primary key (snum, name, level),
    foreign key (snum) references Students(snum),
    foreign key (name, level) references Degrees(name, level)
);

CREATE TABLE Minor (
    snum INTEGER,
    name VARCHAR(50),
    level VARCHAR(5),
    PRIMARY KEY (snum , name , level),
    FOREIGN KEY (snum)
        REFERENCES Students (snum),
    FOREIGN KEY (name , level)
        REFERENCES Degrees (name , level)
);