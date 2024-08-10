use Company_SD

select *
from Employee

select *
from Dependent
-- 1
select Fname + ' ' + Lname  as Employee_NAME , Dependent_name as Dep_name
from Employee , Dependent
UNION
select Fname + ' ' + Lname  as Employee_NAME , Dependent_name as Dep_name
from Employee , Dependent
where Employee.Sex = 'f'

select *
from Project

-- 2
select Pname , sum(Hours) as Total_hours_per_week
from Project inner join Works_for on Project.Pnumber = Works_for.Pno 
group by Project.Pname

--3
select * 
from Departments
where MGRSSN = ( select min(SSN)
                 from Employee);
			 
--4
select Departments.Dname as D_name ,Employee.max(Salary) ,Employee.min(Salary) ,Employee.avg(Salary) 
from Departments inner join  Employee on Departments.MGRSSN = Employee.SSN
group by Departments.Dname , Employee.max(Salary) , Employee.min(Salary) , Employee.avg(Salary)

--5
select Fname + ' ' + Lname as Manager_Name
from Employee E , Dependent D 
where D.ESSN = NULL

--6
SELECT Dnum , Fname + ' ' + Lname as FULL_Name
FROM Departments D, Employee E
WHERE D.Dnum = E.Dnum and 

--8
select Salary
from Employee e1
where 2 = (select count (distinct Salary )
from Employee e2
where e2.Salary>e1.salary
)

--9
SELECT CONCAT(Fname + ' ' + Lname ) AS full_name
FROM employee e
JOIN Dependent d ON e.SSN = d.ESSN
WHERE d.Dependent_name LIKE CONCAT('%', e.Fname, '%')

--10
SELECT SSN , Fname + ' ' + Lname as FULL_Name
FROM Employee
WHERE EXISTS (
    SELECT *
    FROM Dependent
    WHERE Dependent.ESSN = Employee.SSN
);

--11
INSERT INTO Departments ( Dname,Dnum, MGRSSN, MGRStartDate)
VALUES ('DEPT IT',100 , 112233, '1-11-2006');

--12  a
UPDATE Departments
SET MGRSSN = 968574
WHERE Dnum = 100;

--12 b
UPDATE Employee
SET Dno = 20
WHERE ssn = 102672;

--12 c
UPDATE Employee
SET Superssn = 102672
WHERE SSN = 102660;

--13
DELETE FROM Dependent
WHERE ESSN = (
    SELECT SSN
    FROM Employee
    WHERE SSN = 223344
);

DELETE FROM Works_for
WHERE ESSn = 223344;

DELETE FROM Employee
WHERE SSN = 223344;

--14
UPDATE Employee
SET Salary = Salary * 1.3
WHERE Dno IN (
    SELECT Dnum
    FROM Project
    WHERE Pname = 'Al Rabwah'







 