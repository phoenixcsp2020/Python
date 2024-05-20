
CREATE DATABASE Library;
USE Library;

CREATE TABLE Branch(
	Branch_no INT PRIMARY KEY AUTO_INCREMENT,
    Manager_id VARCHAR(20),
    Branch_Address VARCHAR(200),
    Contact_no VARCHAR(15));
    
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no)
VALUES(101, 1, '123 Main St, Springfield', '555-1234'),
(102, 2, '456 Elm St, Shelbyville', '555-5678'),
(103, 3, '789 Oak St, Capital City', '555-8765'),
(104, 4, '101 Maple St, Ogdenville', '555-3456'),
(105, 5, '202 Pine St, North Haverbrook', '555-7890'),
(106, 6, '303 Cedar St, Brockway', '555-2345'),
(107, 7, '404 Birch St, Springfield', '555-3457'),
(108, 8, '505 Walnut St, Shelbyville', '555-4568'),
(109, 9, '606 Chestnut St, Capital City', '555-5679'),
(110, 10, '707 Willow St, Ogdenville', '555-6789');

select * from branch;

CREATE TABLE Employee(
	Emp_Id INT PRIMARY KEY,
	Emp_name VARCHAR(200),
    Position VARCHAR(200),
	Salary DECIMAL(10,2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no));
    
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no)
VALUES(1, 'John Smith', 'Manager', 60000.00, 101),
(2, 'Jane Doe', 'Assistant Manager', 50000.00, 102),
(3, 'Alice Johnson', 'Librarian', 45000.00, 101),
(4, 'Bob Brown', 'Clerk', 35000.00, 103),
(5, 'Emily Davis', 'Senior Librarian', 55000.00, 104),
(6, 'Michael Wilson', 'IT Specialist', 48000.00, 105),
(7, 'Laura Taylor', 'Accountant', 52000.00, 101),
(8, 'David Anderson', 'Security', 30000.00, 103),
(9, 'Sarah Thomas', 'Librarian', 45000.00, 102),
(10, 'James Martinez', 'Assistant Librarian', 40000.00, 104);

SELECT * FROM Employee;

CREATE TABLE Customer(
	Customer_iD INT PRIMARY KEY,
    Customer_name VARCHAR(50),
    Customer_Address VARCHAR(250),
    Reg_Date DATE);
    
INSERT INTO Customer (customer_id, customer_name, customer_address, Reg_Date)
VALUES(1, 'John Doe', '123 Main St, CityA, CountryX', '2024-05-20'),
    (2, 'Jane Smith', '456 Elm St, CityB, CountryY', '2024-05-19'),
    (3, 'Alice Johnson', '789 Oak St, CityC, CountryZ', '2024-05-18'),
    (4, 'Bob Brown', '101 Pine St, CityD, CountryX', '2024-05-17'),
    (5, 'Emily Davis', '202 Maple St, CityE, CountryY', '2024-05-16'),
    (6, 'Michael Wilson', '303 Cedar St, CityF, CountryZ', '2024-05-15'),
    (7, 'Sarah Martinez', '404 Birch St, CityG, CountryX', '2024-05-14'),
    (8, 'David Taylor', '505 Walnut St, CityH, CountryY', '2024-05-13'),
    (9, 'Jessica Rodriguez', '606 Pineapple St, CityI, CountryZ', '2024-05-12'),
    (10, 'Andrew Lee', '707 Banana St, CityJ, CountryX', '2024-05-11');

SELECT * FROM Customer;

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(200),
    Issue_date DATE,
    Isbn_book VARCHAR(50),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(customer_id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN));

    
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES(1, 1, 'The Martian', '2024-05-20', '9780143128540'),
    (2, 2, 'Harry Potter and the Goblet of Fire', '2024-05-19', '9780439139601'),
    (3, 3, '1984', '2024-05-18', '9780451524935'),
    (4, 4, 'The Catcher in the Rye', '2024-05-17', '9780316769488'),
    (5, 5, 'The Great Gatsby', '2024-05-16', '9780743273565'),
    (6, 6, 'The Alchemist', '2024-05-15', '9781501128035'),
    (7, 7, 'Twilight', '2024-05-14', '9780316015844'),
    (8, 8, 'A Game of Thrones', '2024-05-13', '9780553593716'),
    (9, 9, 'The Road', '2024-05-12', '9780385472579'),
    (10, 10, 'The Secret', '2024-05-11', '9780061122415');

SELECT * FROM IssueStatus;
     
CREATE TABLE ReturnStatus(
	Return_Id INT PRIMARY KEY,
    Return_cust VARCHAR(50),
    Return_book_name VARCHAR(200),
    Return_date DATE,
    Isbn_book2 VARCHAR(50),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(Isbn));

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
    (1, 1, 'The Martian', '2024-05-20', '9780143128540'),
    (2, 2, 'Harry Potter and the Goblet of Fire', '2024-05-19', '9780439139601'),
    (3, 3, '1984', '2024-05-18', '9780451524935'),
    (4, 4, 'The Catcher in the Rye', '2024-05-17', '9780316769488'),
    (5, 5, 'The Great Gatsby', '2024-05-16', '9780743273565'),
    (6, 6, 'The Alchemist', '2024-05-15', '9781501128035'),
    (7, 7, 'Twilight', '2024-05-14', '9780316015844'),
    (8, 8, 'A Game of Thrones', '2024-05-13', '9780553593716'),
    (9, 9, 'The Road', '2024-05-12', '9780385472579'),
    (10, 10, 'The Secret', '2024-05-11', '9780061122415');

SELECT * FROM ReturnStatus;

CREATE TABLE Books(
	Isbn VARCHAR(50) PRIMARY KEY,
    Book_title VARCHAR(200),
    Category VARCHAR(100),
    Rental_Price DECIMAL(10,2),
    Status ENUM('YES','NO'),
    Author VARCHAR(100),
    Publisher VARCHAR(100));

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES('9780143128540', 'The Martian', 'Science Fiction', 4.99, 'yes', 'Andy Weir', 'Crown Publishing Group'),
('9780439139601', 'Harry Potter and the Goblet of Fire', 'Fantasy', 5.99, 'no', 'J.K. Rowling', 'Bloomsbury'),
('9780451524935', '1984', 'Dystopian', 3.99, 'yes', 'George Orwell', 'Secker & Warburg'),
('9780316769488', 'The Catcher in the Rye', 'Classic', 4.49, 'yes', 'J.D. Salinger', 'Little, Brown and Company'),
('9780743273565', 'The Great Gatsby', 'Classic', 4.29, 'no', 'F. Scott Fitzgerald', 'Charles Scribner''s Sons'),
('9781501128035', 'The Alchemist', 'Fiction', 4.79, 'yes', 'Paulo Coelho', 'HarperOne'),
('9780316015844', 'Twilight', 'Fantasy', 5.49, 'yes', 'Stephenie Meyer', 'Little, Brown and Company'),
('9780553593716', 'A Game of Thrones', 'Fantasy', 5.99, 'no', 'George R.R. Martin', 'Bantam Books'),
('9780385472579', 'The Road', 'Post-Apocalyptic', 4.69, 'yes', 'Cormac McCarthy', 'Alfred A. Knopf'),
('9780061122415', 'The Secret', 'Self-help', 3.99, 'yes', 'Rhonda Byrne', 'Atria Books');

SELECT * FROM BOOKS;

#1.	Retrieve the book title, category, and rental price of all available books.
	SELECT Book_title,Category,Rental_Price,Status FROM Books WHERE Status='YES';

#2.	List the employee names and their respective salaries in descending order of salary.
	SELECT Emp_name,Salary FROM Employee ORDER BY Salary DESC;

#3.	Retrieve the book titles and the corresponding customers who have issued those books.
	SELECT Issued_book_name, Customer_name FROM IssueStatus
	JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

#4.	Display the total count of books in each category.
	SELECT Category, COUNT(*) AS Total_Count FROM Books GROUP BY Category;
 
#5.	Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
	SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

#6.	List the customer names who registered before 2022-01-01 and have not issued any books yet.
	SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01'
	AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

#7.	Display the branch numbers and the total count of employees in each branch.
	SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no;

#8.	Display the names of customers who have issued books in the month of June 2023.
	SELECT DISTINCT Customer_name FROM Customer
	JOIN IssueStatus ON Customer.Customer_Id = IssueStatus.Issued_cust
	WHERE YEAR(Issue_date) = 2023 AND MONTH(Issue_date) = 6;

#9.	Retrieve book title from book table containing history. 
	SELECT Book_title FROM Books WHERE Category = 'History';

#10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
	SELECT Branch_no, COUNT(*) AS Total_Employees FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;




