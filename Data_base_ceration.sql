CREATE TABLE instructor (
    id INT IDENTITY(1,1) PRIMARY KEY,
    Fname VARCHAR(20) NOT NULL,
	Lname VARCHAR(20) NOT NULL,
    birthdate DATE NOT NULL,
    address VARCHAR(50) CHECK (address IN ('Cairo', 'Alex')),
    salary DECIMAL(10,2) DEFAULT 3000 CHECK (salary BETWEEN 1000 AND 5000),
    overtime INT UNIQUE,
    netsalary AS (salary + overtime),
    age AS (YEAR(GETDATE()) - YEAR(birthdate)),
    hiredate DATE DEFAULT GETDATE(),
);

CREATE TABLE lab (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    capacity INT CHECK (capacity < 20),
    course_id INT NOT NULL FOREIGN KEY REFERENCES instructor(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE course (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    duration INT UNIQUE
);
CREATE TABLE TEACH (
    ID INT NOT NULL FOREIGN KEY REFERENCES instructor(id)  ,
	CID INT NOT NULL FOREIGN KEY REFERENCES course(id)  ,
	PRIMARY KEY (ID,CID)
);