# librarydb
# Task 6: Subqueries and Nested Queries

## 🎯 Objective
Enhance SQL skills by using subqueries (also called nested queries) inside `SELECT`, `FROM`, and `WHERE` clauses to filter, group, and fetch complex logic-driven data.

## 🛠️ Tools Used
- MySQL Workbench (or DB Browser for SQLite)
- SQL

## 📂 Database Structure

This task uses the same **Library Management Database** created in previous tasks. The key tables involved are:

- `Authors(AuthorID, Name)`
- `Books(BookID, Title, AuthorID)`
- `Members(MemberID, Name, Email)`
- `Loans(LoanID, BookID, MemberID, LoanDate, ReturnDate)`

## 🔍 Subquery Examples Included

```sql
-- Members who borrowed more than one book
SELECT Name
FROM Members
WHERE MemberID IN (
    SELECT MemberID
    FROM Loans
    GROUP BY MemberID
    HAVING COUNT(*) > 1
);

-- Books that are currently on loan (not returned)
SELECT Title
FROM Books
WHERE BookID IN (
    SELECT BookID
    FROM Loans
    WHERE ReturnDate IS NULL
);

-- Authors who have written at least two books
SELECT Name
FROM Authors
WHERE AuthorID IN (
    SELECT AuthorID
    FROM Books
    GROUP BY AuthorID
    HAVING COUNT(*) >= 2
);

-- Members who have never borrowed a book
SELECT Name
FROM Members
WHERE MemberID NOT IN (
    SELECT DISTINCT MemberID
    FROM Loans
);

-- Member who borrowed the most books
SELECT Name
FROM Members
WHERE MemberID = (
    SELECT MemberID
    FROM Loans
    GROUP BY MemberID
    ORDER BY COUNT(*) DESC
    LIMIT 1
);
