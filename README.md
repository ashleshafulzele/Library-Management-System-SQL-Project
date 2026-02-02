# Library Management System - SQL Project

## Project Description
The Library Management System is a database-driven project developed using MySQL to manage all core library operations efficiently. This system allows a library to keep track of books, members, employees, branches, book issues, and returns.  

The project demonstrates:
- Database design and normalization by creating multiple related tables with proper primary and foreign keys.  
- Data operations such as inserting new records, updating existing data, deleting records, and retrieving information using complex queries.  
- Analytical capabilities, including generating book issue summaries, tracking rental income by category, and identifying members with multiple book issues.  
- Practical SQL techniques such as JOIN, GROUP BY, HAVING, and CTAS (Create Table As Select) for creating summary tables.

This project is ideal for students and professionals looking to understand real-world library database operations and SQL query optimization.

---

## Features
- Create and manage branches, employees, members, and books.
- Track issued and returned books.
- Update member addresses.
- Delete issued book records.
- Generate book issue summary and rental income reports.
- Find members who issued multiple books.
- List books by category and books with rental price above a threshold.
- Retrieve books not yet returned.
- Display employee details along with their branch manager.

---

## Database Structure

### Tables

1. branch
   - branch_id (PK)
   - manager_id
   - branch_address
   - contact_no

2. employee
   - emp_id (PK)
   - emp_name
   - position
   - salary
   - branch_id (FK → branch.branch_id)

3. books
   - isbn (PK)
   - book_title
   - category
   - rental_price
   - status
   - author
   - publisher

4. members
   - member_id (PK)
   - member_name
   - member_address
   - reg_date

5. issued_status
   - issued_id (PK)
   - issued_member_id (FK → members.member_id)
   - issued_book_name
   - issued_date
   - issued_book_isbn (FK → books.isbn)
   - issued_emp_id (FK → employee.emp_id)

6. return_status
   - return_id (PK)
   - issued_id (FK → issued_status.issued_id)
   - return_book_name
   - return_date
   - return_book_isbn
---

**Key Relationships:**
- Employees are linked to branches
- Issued books are linked to members, employees, and books
- Returns are linked to issued books

---

## Data Operations Performed
The following SQL operations were implemented in the project:
- Inserting sample data for branches, employees, books, members, issued books, and returns
- Updating member information
- Deleting issued book records
- Retrieving analytical information from the database, such as total books issued by members or rental income per book category

---

## Key Analytical Queries & Insights
Some of the key analytical queries and business insights include:
- List members who have issued more than one book
- Generate book issue summary reports
- Identify books not yet returned
- Calculate total rental income per book category
- List rare books based on rental price
- Retrieve all books issued by a specific employee
- Display employee details along with their branch manager

These queries demonstrate SQL skills such as JOIN, GROUP BY, HAVING, aggregation, and table summarization.

---

## Tools Used
- Database: MySQL / MariaDB
- Query Language: SQL
- Concepts: Database design, foreign keys, data insertion, updates, deletions, joins, aggregation, and CTAS (Create Table As Select)

---

## How to Run This Project
1. Create the database in MySQL.
2. Create all tables and define foreign key relationships.
3. Insert sample data into all tables.
4. Run analytical queries to generate insights and reports.
5. Explore operations like updating member data, deleting issued records, and summarizing book usage.

---

## Notes
- Ensure foreign key relationships are enabled before inserting dependent data.
- Modify employee or branch IDs if required based on your local dataset.
- Ideal for students and professionals looking to practice real-world database management and SQL analytics.
