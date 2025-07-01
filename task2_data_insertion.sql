-- Create Tables
CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    Name VARCHAR(100)
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(150),
    AuthorID INT,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100)
);

CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Insert Data
INSERT INTO Authors (AuthorID, Name) VALUES
(1, 'J.K. Rowling'),
(2, 'George Orwell'),
(3, 'Jane Austen');

INSERT INTO Books (BookID, Title, AuthorID) VALUES
(1, 'Harry Potter', 1),
(2, '1984', 2),
(3, 'Pride and Prejudice', 3),
(4, 'Book Without Author', NULL);

INSERT INTO Members (MemberID, Name, Email) VALUES
(1, 'Alice', 'alice@example.com'),
(2, 'Bob', NULL),
(3, 'Charlie', 'charlie@example.com');

INSERT INTO Loans (LoanID, BookID, MemberID, LoanDate, ReturnDate) VALUES
(1, 1, 1, '2024-01-01', '2024-01-15'),
(2, 2, 2, '2024-02-01', NULL),
(3, 3, 1, '2024-03-10', '2024-03-20');

-- Update
UPDATE Members
SET Email = 'bob@example.com'
WHERE MemberID = 2;

UPDATE Books
SET Title = '1984 (Updated Edition)'
WHERE BookID = 2;

-- Delete
DELETE FROM Loans WHERE LoanID = 3;
DELETE FROM Members WHERE MemberID = 3;
