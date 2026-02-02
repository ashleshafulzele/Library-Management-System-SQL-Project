-- TASK 1: Create a New Book Record -- "978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.')

INSERT INTO books (isbn, book_title, category, rental_price, status, author, publisher) 
VALUES ('978-1-60129-456-2', 'To Kill a Mockingbird', 'Classic', 6.00, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.');

SELECT * FROM books;

-- Task 2: Update an Existing Member's Address

UPDATE members SET member_address = '246 Church'
WHERE member_id = 'C102';

SELECT * FROM members;

-- Task 3: Delete a Record from the Issued Status Table 
-- Objective: Delete the record with issued_id = 'IS121' from the issued_status table.

DELETE FROM issued_status
WHERE issued_id = 'IS121';

SELECT * FROM issued_status;

-- Task 4: Retrieve All Books Issued by a Specific Employee 
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT * FROM issued_status
WHERE issued_emp_id = 'E101';

-- Task 5: List Members Who Have Issued More Than One Book 
-- Objective: Use GROUP BY to find members who have issued 
-- more than one book.

SELECT issued_member_id,
COUNT(issued_id) AS total_books_issued
FROM issued_status
GROUP By issued_member_id 
HAVING COUNT(issued_id) > 1;

--  CTAS (Create Table As Select)
 
-- Task 6: Create Summary Tables: Used CTAS to generate new tables 
-- based on query results - each book and total book_issued_cnt**

CREATE TABLE book_issue_summary AS
SELECT 
    i.issued_book_isbn AS isbn,
    b.book_title,
    COUNT(i.issued_id) AS total_book_issued_cnt
FROM issued_status i
JOIN books b 
ON i.issued_book_isbn = b.isbn
GROUP BY i.issued_book_isbn, b.book_title;

SELECT * FROM book_issue_summary;

--  Task 7. Retrieve All Books in a Specific Category
SELECT * FROM books
WHERE category ='Classic';

-- Task 8: Find Total Rental Income by Category
SELECT b.category, 
SUM(b.rental_price) AS total_rental_income
FROM issued_status i
JOIN books b
ON i.issued_book_isbn = b.isbn
GROUP BY b.category;

-- Task 9: List Members Who Registered in the Last 680 Days

SELECT * FROM members
WHERE reg_date >= CURRENT_DATE - INTERVAL 680 DAY ;

-- Task 10: List Employees with Their Branch Manager's Name and their branch details

SELECT
e.emp_id,e.emp_name,e.position,e.salary,b.branch_id,b.branch_address,b.contact_no,m.emp_name AS manager_name
FROM employee e
JOIN branch b
ON e.branch_id = b.branch_id
JOIN employee m
ON b.manager_id = m.emp_id;

-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold

CREATE TABLE rare_books AS
SELECT * FROM books
WHERE rental_price > 7;

SELECT * FROM rare_books;

-- Task 12: Retrieve the List of Books Not Yet Returned

SELECT * FROM issued_status AS ist
LEFT JOIN return_status AS rs
ON rs.issued_id = ist.issued_id
WHERE rs.return_id IS NULL;




















































































