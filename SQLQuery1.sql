select *
from Employee

select Fname,Lname,Salary,Dno
from Employee

select Pname,Plocation,Dname
from Project,Departments

select Fname +''+Lname as FullName , Salary *0.1*12 as Annual_salary
from Employee

select SSN , Fname +''+Lname as FullName
from Employee
where Salary > 1000

select SSN , Fname +''+Lname as FullName  
from Employee
where  Salary*12 > 10000

select Fname +''+Lname as FullName ,Salary
from Employee
where Sex = 'F'

select MGRSSN ,Dname
from Departments
where MGRSSN = 968574

select Dnum , Pname , Plocation
from Project
where Dnum = 10