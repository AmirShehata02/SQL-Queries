use Company_SD

select * 
from Departments
--------
select *
from Dependent
--------
select *
from Employee
--------
select *
from Project
--------
select *
from Works_for
--------------------
--1
select Dnum , Dname ,MGRSSN , Fname +' '+Lname as Manager_Name
from Departments , Employee
--2
select Dname ,Pname 
from Departments , Project 
where Project.Dnum = Departments.Dnum 
--3
select *
from Dependent 
where Employee.(select Fname + ' ' + Lname as FULL_NAME = Dependent.Dependent_name 
from Employee );
--4      
SELECT Pnumber, Pname, Plocation
FROM Project
WHERE City IN ('Cairo', 'Alex')
--5
select * 
from Project
where Pname like 'a%'
--6
SELECT *
FROM Employee
WHERE Dno = 30 AND Salary BETWEEN 1000 AND 2000;
--7
SELECT Fname + ' ' + Lname as FULL_NAME
FROM Employee
JOIN Works_for ON Employee.SSN = Works_for.ESSn
JOIN Project ON Works_for.Pno = Project.Pnumber
WHERE Employee.Dno = 10
  AND Project.Pname = 'AL Rabwah'
  AND Works_for.Hours >= 10
---8
SELECT Fname + ' ' + Lname as FULL_NAME 
FROM Employee E ,Departments D
where E.Superssn = D.MGRSSN   
--9
SELECT Fname + ' ' + Lname as FULL_NAME ,PName
FROM Employee E , Project P
where E.Dno = P.Dnum
ORDER BY Project.PName
--10
select Pnumber , Plocation 
from Project
join Departments on Departments.Dnum = Project.Dnum
join Employee on Employee.SSN = Departments.MGRSSN 
where Plocation = 'Cairo'
group by Plocation
--11
SELECT *
FROM Employee
join Departments on Departments.MGRSSN = Employee.SSN
--12
select * 
from Employee 
left join Departments on Employee.Dno = Departments.Dnum
--13
insert into Employee (Fname ,Lname,SSN,Bdate,Address,Sex,Salary,Superssn,Dno)
values ('Amir' , 'Ahmed' , 102672 , 2002-12-13 , 'Quesna' , 'F' , 20000 , 333331 ,NULL)
--14
insert into Employee (Fname,Lname,SSN,Dno)
values ( 'Ahmed' , 'Mohamed' ,102660,30)
--15
update Employee 
set Salary = Salary*1.2




