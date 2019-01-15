USE db_LIBRARY
GO

CREATE TABLE tbl_LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

INSERT INTO tbl_LIBRARY_BRANCH 
	(BranchName, Address)
	VALUES
	('Sharpstown', '2134 Krimping Road'),
	('Central', '923 Middling Avenue'),
	('Upton', '1735 Philadelphia Way'),
	('New Ducksberg', '7334 Quacker Pond')
;
SELECT * FROM tbl_LIBRARY_BRANCH

CREATE TABLE tbl_PUBLISHER (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Phone VARCHAR(20) NOT NULL
);

INSERT INTO tbl_PUBLISHER
	(PublisherName, Address, Phone)
	VALUES
	('Penguin Random House', '1745 Broadway New York, NY 10019', '(212) 782-9000'),
	('Hachette Book Group', '237 Park Avenue New York, NY 10017', '(212) 364-1200'),
	('HarperCollins', '195 Broadway New York, NY 10007', '(212) 207-7000'),
	('Macmillan Publishers', '175 Fifth Avenue New York, NY 10010', '(646) 307-5151'),
	('Simon and Schuster', '1230 Avenue of the Americas New York, NY 10020', '(212) 698-7000')
;
SELECT * FROM tbl_PUBLISHER

CREATE TABLE tbl_BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (500,1),
	Title VARCHAR(100) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES tbl_PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);

INSERT INTO tbl_BOOKS
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Penguin Random House'), --Mark E. Davidson
	('Killing Commendatore', 'Penguin Random House'), --Haruki Murakami
	('The Last Girl', 'Penguin Random House'), --Nadia Murad
	('The Age of Walls', 'Simon and Schuster'), --Tim Marshal
	('The Battle of Jericho Hill', 'Simon and Schuster'), --Stephen King
	('Sleeping Beauties', 'Simon and Schuster'), --Stephen King
	('Malala', 'Hachette Book Group'), --Malala Yousafzi
	('The Catcher in the Rye', 'Hachette Book Group'), --J.D. Salinger
	('Choose Your Own Disaster', 'Hachette Book Group'), --Dana Schwartz
	('Leviathan Wakes', 'Hachette Book Group'), --James S.A. Corey
	('Stamped From The Beginning', 'Hachette Book Group'), --Ibram X. Kendi
	('The Chronicles Of Narnia', 'HarperCollins'), --C.S. Lewis
	('The Poet X', 'HarperCollins'), --Elizabeth Acevado
	('We Fed an Island', 'HarperCollins'), --Jose Andres
	('The Apprentice', 'HarperCollins'), --Greg Miller
	('The Perfectionists', 'HarperCollins'), --Simon Winchester
	('Red Queen', 'HarperCollins'), --Victoria Aveyard
	('The Tiger''s Daughter', 'Macmillan Publishers'), --K Arsenault Rivera
	('All Systems Red', 'Macmillan Publishers'), --Martha Wells
	('Binti', 'Macmillan Publishers'), --Nnedi Okorafor
	('Holes', 'Macmillan Publishers'), --Louis Sachar
	('Updraft', 'Macmillan Publishers'), --Fran Wilde
	('No Good Men Among	the Living', 'Macmillan Publishers'), --Amand Gopal
	('A Darker Shade of Magic', 'Macmillan Publishers') --V. E. Schwab
;
SELECT * FROM tbl_BOOKS

CREATE TABLE tbl_BOOK_AUTHORS (
	BookID INT NOT NULL CONSTRAINT fk_BookID FOREIGN KEY REFERENCES tbl_BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);

INSERT INTO tbl_BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	(500, 'Mark E Davidson'),
	(501, 'Haruki Murakami'),
	(502, 'Nadia Murad'),
	(503, 'Tim Marshal'),
	(504, 'Stephen King'),
	(505, 'Stephen King'),
	(506, 'Malala Yousafzi'),
	(507, 'J.D. Salinger'),
	(508, 'Dana Schwartz'),
	(509, 'James S.A. Corey'),
	(510, 'Ibram X. Kendi'),
	(511, 'C.S. Lewis'),
	(512, 'Elizabeth Acevado'),
	(513, 'Jose Andres'),
	(514, 'Greg Miller'),
	(515, 'Simon Winchester'),
	(516, 'Victoria Aveyard'),
	(517, 'K Arsenault Rivera'),
	(518, 'Martha Wells'),
	(519, 'Nnedi Okorafor'),
	(520, 'Louis Sachar'),
	(521, 'Fran Wilde'),
	(522, 'Amand Gopal'),
	(523, 'V. E. Schwab')
;

SELECT * FROM tbl_BOOK_AUTHORS

CREATE TABLE tbl_BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_copiesBookID FOREIGN KEY REFERENCES tbl_BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
);

INSERT INTO tbl_BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(500, 1, 12),
	(500, 2, 23),
	(500, 3, 13),
	(501, 1, 19),
	(501, 2, 13),
	(501, 4, 23),
	(502, 1, 24),
	(502, 2, 14),
	(503, 1, 17),
	(503, 2, 18),
	(503, 3, 15),
	(503, 4, 16),
	(504, 1, 17),
	(504, 2, 17),
	(504, 3, 12),
	(504, 4, 13),
	(505, 1, 26),
	(505, 2, 12),
	(505, 3, 15),
	(506, 4, 19),
	(506, 1, 14),
	(506, 2, 16),
	(506, 3, 17),
	(507, 4, 14),
	(507, 1, 16),
	(507, 2, 16),
	(508, 3, 13),
	(508, 4, 15),
	(508, 1, 14),
	(508, 2, 18),
	(509, 3, 10),
	(509, 4, 19),
	(509, 1, 12),
	(509, 2, 13),
	(510, 3, 23),
	(510, 4, 26),
	(510, 1, 12),
	(510, 2, 16),
	(511, 3, 15),
	(511, 4, 13),
	(511, 1, 12),
	(511, 2, 19),
	(512, 3, 12),
	(512, 4, 18),
	(512, 1, 13),
	(512, 2, 12),
	(513, 3, 18),
	(513, 4, 12),
	(513, 1, 15),
	(514, 2, 17),
	(514, 3, 14),
	(514, 4, 23),
	(514, 1, 23),
	(515, 2, 36),
	(515, 3, 22),
	(515, 4, 12),
	(515, 1, 15),
	(516, 2, 26),
	(516, 3, 17),
	(516, 4, 21),
	(517, 1, 16),
	(517, 2, 18),
	(517, 3, 13),
	(517, 4, 16),
	(518, 1, 12),
	(518, 2, 15),
	(518, 3, 19),
	(518, 4, 16),
	(519, 1, 18),
	(519, 2, 17),
	(519, 3, 12),
	(519, 4, 15),
	(520, 1, 14),
	(520, 2, 13),
	(520, 3, 15),
	(520, 4, 19),
	(521, 1, 18),
	(521, 2, 17),
	(521, 3, 15),
	(521, 4, 14),
	(522, 1, 13),
	(522, 2, 17),
	(522, 3, 13),
	(522, 4, 15),
	(523, 1, 16),
	(523, 2, 12),
	(523, 3, 19),
	(523, 4, 25)
;
SELECT * FROM tbl_BOOK_COPIES

CREATE TABLE tbl_BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (2000,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

INSERT INTO tbl_BORROWER
	(Name, Address, Phone)
	VALUES
	('Marion Barnett', '4151 Sarah Drive', '908-644-8006'),
	('Lorenzo Fernandez', '4459 Wyatt Street', '320-547-6702'),
	('Caroline Holmes', '3975 Harley Vincent Drive', '414-525-7804'),
	('Morris Padilla', '3057 Hart Street', '740-322-4636'),
	('Isabel Edwards', '189 Half and Half Drive', '360-775-7938'),
	('Ken Hart', '1235 Boundary Street', '925-509-6526'),
	('Salvador Floyd', '842 Pinnickinick Street', '516-256-2348'),
	('Bobbie Ballard', '4525 Rubaiyat Road', '617-400-7074'),
	('Johnathan Lynch', '4481 Pinewood Avenue', '865-594-1887'),
	('Harriet Mills', '1155 Hedge Street', '619-669-7851')
;
SELECT * FROM tbl_BORROWER

CREATE TABLE tbl_BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_loansBookID FOREIGN KEY REFERENCES tbl_BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_loansBranchID FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_loansCardNo FOREIGN KEY REFERENCES tbl_BORROWER(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut INT NOT NULL,
	DateDue INT NOT NULL,
);

INSERT INTO tbl_BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(500, 1, 2000, 20181010, 20181110),
	(500, 1, 2001, 20181009, 20181109),
	(500, 1, 2005, 20180915, 20181015),
	(500, 2, 2009, 20180927, 20181027),
	(500, 3, 2004, 20180813, 20180913),
	(501, 1, 2000, 20181010, 20181110),
	(501, 4, 2007, 20181007, 20181107),
	(502, 1, 2000, 20181010, 20181110),
	(502, 2, 2009, 20180927, 20181027),
	(503, 2, 2009, 20180927, 20181027),
	(503, 3, 2006, 20181008, 20181108),
	(503, 4, 2007, 20181007, 20181107), 
	(504, 1, 2000, 20181010, 20181110),
	(504, 2, 2009, 20180927, 20181027),
	(504, 4, 2007, 20181007, 20181107),
	(505, 1, 2000, 20181010, 20181110),
	(505, 3, 2004, 20180813, 20180913),
	(506, 4, 2007, 20181007, 20181107),
	(506, 1, 2000, 20181010, 20181110),
	(506, 1, 2000, 20180911, 20181011),
	(506, 3, 2004, 20180813, 20180913),
	(507, 1, 2000, 20181010, 20181110),
	(507, 2, 2009, 20180927, 20181027),
	(508, 3, 2006, 20181008, 20181108),
	(508, 1, 2000, 20181010, 20181110),
	(508, 2, 2009, 20180927, 20181027),
	(510, 2, 2009, 20180927, 20181027),
	(511, 3, 2006, 20181008, 20181108),
	(511, 4, 2007, 20181007, 20181107),
	(511, 2, 2009, 20180927, 20181027),
	(512, 3, 2006, 20181008, 20181108),
	(513, 3, 2004, 20180813, 20180913),
	(513, 4, 2007, 20181007, 20181107),
	(514, 2, 2009, 20180927, 20181027),
	(514, 3, 2004, 20180813, 20180913),
	(515, 2, 2009, 20180927, 20181027),
	(515, 4, 2007, 20181007, 20181107),
	(516, 4, 2007, 20181007, 20181107),
	(517, 1, 2000, 20181010, 20181110),
	(517, 2, 2009, 20180927, 20181027),
	(518, 1, 2000, 20181010, 20181110),
	(518, 2, 2009, 20180927, 20181027),
	(519, 1, 2000, 20181010, 20181110),
	(519, 2, 2009, 20180927, 20181027),
	(519, 4, 2007, 20181007, 20181107),
	(520, 2, 2009, 20180927, 20181027),
	(520, 4, 2007, 20181007, 20181107),
	(521, 4, 2007, 20181007, 20181107),
	(522, 2, 2009, 20180927, 20181027),
	(522, 3, 2002, 20180929, 20181029),
	(523, 1, 2001, 20181001, 20181101),
	(523, 2, 2009, 20180927, 20181027),
	(523, 3, 2002, 20180929, 20181029),
	(523, 4, 2007, 20181007, 20181107)
;
SELECT * FROM tbl_BOOK_LOANS

--Drill #1

CREATE PROC dbo.uspGetLostTribeSharptown
AS
SELECT Number_Of_Copies FROM tbl_BOOK_COPIES
	WHERE tbl_BOOK_COPIES.BranchID = 1
	AND tbl_BOOK_COPIES.BookID = 500
GO

EXEC uspGetLostTribeSharptown

--Drill #2

CREATE PROC dbo.uspGetLostTribeTotal
AS
SELECT Number_Of_Copies FROM tbl_BOOK_COPIES
	WHERE tbl_BOOK_COPIES.BookID = 500
GO

EXEC uspGetLostTribeTotal

--Drill #3

CREATE PROC dbo.uspGetBorrowersWNoBooks
AS
SELECT tbl_BORROWER.Name FROM tbl_BORROWER
	FULL OUTER JOIN tbl_BOOK_LOANS ON tbl_BORROWER.CardNo = tbl_BOOK_LOANS.CardNo
	GROUP BY tbl_BORROWER.Name
	HAVING COUNT(tbl_BOOK_LOANS.CardNo) = 0
GO

EXEC uspGetBorrowersWNoBooks

--Drill #4

CREATE PROC dbo.uspGetSharpstownBooksDueToday
AS
SELECT tbl_BOOKS.Title, a2.Name, a2.Address FROM tbl_BOOKS
	INNER JOIN tbl_BOOK_LOANS a1 ON tbl_BOOKS.BookID = a1.BookID
	INNER JOIN tbl_BORROWER a2 ON a1.CardNo = a2.CardNo
	WHERE a1.DateDue = 20181011
	AND a1.BranchID = 1
GO

EXEC uspGetSharpstownBooksDueToday

-- Drill #5 

CREATE PROC dbo.uspGetBranchNamesAndLoans
AS
SELECT COUNT(tbl_BOOK_LOANS.BranchID) AS 'Sharpstown Loans: '
	FROM tbl_BOOK_LOANS
	WHERE tbl_BOOK_LOANS.BranchID = 1;
SELECT COUNT(tbl_BOOK_LOANS.BookID) AS 'Central Loans: '
	FROM tbl_BOOK_LOANS
	WHERE tbl_BOOK_LOANS.BranchID = 2;
SELECT COUNT(tbl_BOOK_LOANS.BranchID) AS 'Upton Loans: '
	FROM tbl_BOOK_LOANS
	WHERE tbl_BOOK_LOANS.BranchID = 3;
SELECT COUNT(tbl_BOOK_LOANS.BranchID) AS 'New Ducksberg Loans: '
	FROM tbl_BOOK_LOANS
	WHERE tbl_BOOK_LOANS.BranchID = 4;
GO

EXEC uspGetBranchNamesAndLoans


--Drill #6

CREATE PROC dbo.uspGetBorrowersWOverFiveBooks
AS
SELECT tbl_BORROWER.Name, tbl_BORROWER.Address, COUNT(tbl_BOOK_LOANS.CardNo) AS '# of Books Borrowed' FROM tbl_BORROWER
	FULL OUTER JOIN tbl_BOOK_LOANS ON tbl_BORROWER.CardNo = tbl_BOOK_LOANS.CardNo
	GROUP BY tbl_BORROWER.Name, tbl_BORROWER.Address
	HAVING COUNT(tbl_BOOK_LOANS.CardNo) > 5
GO

EXEC uspGetBorrowersWOverFiveBooks

--Drill #7

CREATE PROC dbo.uspGetSKingBooksFromCentral
AS
SELECT a1.Title, a2.Number_Of_Copies FROM tbl_BOOK_AUTHORS
	INNER JOIN tbl_BOOKS a1 ON tbl_BOOK_AUTHORS.BookID = a1.BookID
	INNER JOIN tbl_BOOK_COPIES a2 ON tbl_BOOK_AUTHORS.BookID = a2.BookID
	INNER JOIN tbl_LIBRARY_BRANCH ON a2.BranchID = tbl_LIBRARY_BRANCH.BranchID
	WHERE tbl_BOOK_AUTHORS.AuthorName = 'Stephen King'
	AND tbl_LIBRARY_BRANCH.BranchName = 'Central'
GO

EXEC uspGetSKingBooksFromCentral