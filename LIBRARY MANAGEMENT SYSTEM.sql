CREATE DATABASE LIBRARY ;
USE LIBRARY ;

CREATE TABLE BRANCH (
BRANCH_NO INT PRIMARY KEY,
MANAGER_ID INT,
BRANCH_ADDRESS VARCHAR(200),
CONTACT_N0 VARCHAR(20)
) ;

CREATE TABLE EMPLOYEE (
Emp_id int primary key,
Emp_name varchar(50),
position varchar(50),
salary decimal(10,2),
branch_no int,
foreign key (branch_no)references branch(branch_no)
) ;

create table BOOKS(
ISBN VARCHAR(20) PRIMARY KEY,
Book_title varchar(100),
category varchar(50),
Rental_price decimal(10,2),
status varchar(10),
Author varchar(50),
Publisher varchar(50)
) ;
create table customer(
customer_id int primary key,
Customer_name varchar(50),
Customer_address varchar(200),
Reg_date date) ;
create table IssueStatus(
Issue_id int primary key,
Issue_cust int,
Issue_book_name varchar(100),
Issue_date date,
Isbn_book varchar(20),
foreign key (Issue_cust) references customer(customer_id),
foreign key (Isbn_book) references Books(ISBN)
) ;
create table ReturnStatus (
Return_id int primary key,
Return_cust int,
Return_book_name varchar(100),
Return_date date,
Isbn_book2 varchar(20),
foreign key (Isbn_book2) references Books(ISBN)
) ;


-- 1

select Book_title,Category,Rental_Price
from Books
where status = 'yes' ;

-- 2

select Emp_name,salary
from Employee
Order by salary desc ;


-- 3

SELECT B.Book_title, C.Customer_name
FROM Books B
JOIN IssueStatus I ON B.ISBN = I.Isbn_book
JOIN Customer C ON I.Issue_cust = C.Customer_Id;

-- 4


SELECT Category, COUNT(*)
FROM Books
GROUP BY Category;

-- 5


SELECT Emp_name, Position
FROM Employee
WHERE Salary > 50000;

-- 6
SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issue_cust FROM IssueStatus);

-- 7


SELECT B.Branch_no, COUNT(*)
FROM Branch B
JOIN Employee E ON B.Branch_no = E.Branch_no
GROUP BY B.Branch_no;

 -- 8
 
 
SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issue_cust
WHERE MONTH(Issue_date) = 6 AND YEAR(Issue_date) = 2023;

-- 9


SELECT Book_title
FROM Books
WHERE Book_title LIKE '%history%';

-- 10


SELECT B.Branch_no, COUNT(*)
FROM Branch B
JOIN Employee E ON B.Branch_no = E.Branch_no
GROUP BY B.Branch_no
HAVING COUNT(*) > 5;

-- 11


SELECT E.Emp_name, B.Branch_address
FROM Employee E
JOIN Branch B ON E.Emp_Id = B.Manager_Id;

-- 12


SELECT C.Customer_name
FROM Customer C
JOIN IssueStatus I ON C.Customer_Id = I.Issue_cust
JOIN Books B ON I.Isbn_book = B.ISBN
WHERE B.Rental_Price > 25;