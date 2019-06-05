USE [Library]
GO

/******* CREATE TABLES ***********/

CREATE TABLE tbl_library_branch (
	branch_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	branch_name VARCHAR(30) NOT NULL,
	[address] VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_publisher (
	publisher_name VARCHAR(30) PRIMARY KEY NOT NULL,
	[address] VARCHAR(30) NOT NULL,
	phone VARCHAR(12) NOT NULL
);

CREATE TABLE tbl_books (
	book_id INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	title VARCHAR(50) NOT NULL,
	publisher_name VARCHAR(30) NOT NULL FOREIGN KEY REFERENCES tbl_publisher(publisher_name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_book_authors (
	book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	author_name VARCHAR(30) NOT NULL
);

CREATE TABLE tbl_borrower (
	card_no INT PRIMARY KEY NOT NULL IDENTITY(1,1),
	[name] VARCHAR(30) NOT NULL,
	[address] VARCHAR(30) NOT NULL,
	phone VARCHAR(12) NOT NULL
);

CREATE TABLE tbl_book_copies (
	book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	number_of_copies INT NOT NULL
);

CREATE TABLE tbl_book_loans (
	book_id INT NOT NULL FOREIGN KEY REFERENCES tbl_books(book_id) ON UPDATE CASCADE ON DELETE CASCADE,
	branch_id INT NOT NULL FOREIGN KEY REFERENCES tbl_library_branch(branch_id) ON UPDATE CASCADE ON DELETE CASCADE,
	card_no INT NOT NULL FOREIGN KEY REFERENCES tbl_borrower(card_no) ON UPDATE CASCADE ON DELETE CASCADE,
	date_out DATE NOT NULL, 
	date_due DATE NOT NULL
);

/******* POPULATE TABLES ***********/

INSERT INTO tbl_library_branch
	(branch_name, [address])
VALUES
	('Main', '123 South Street'),
	('East Side', '345 Main Street'),
	('Sharpstown', '7889 Hue Road'),
	('Central', '9876 Stewart NE')
;

INSERT INTO tbl_publisher
	(publisher_name, [address], phone)
VALUES
	('Pearson', '345 Fairview Street', '253-876-9876'),
	('Harper Collins', '122 Stargate Lane', '253-987-8765'),
	('Simon & Schuster', '7655 Main Street', '876-987-6543'),
	('Penguin Random House', '8765 Barlow Ave', '876-877-8765')
;

INSERT INTO tbl_books
	(title, publisher_name)
VALUES
	('The Lost Tribe','Pearson'),
	('To Kill a Mockingbird', 'Harper Collins'),
	('I Was Told There Would Be Cake', 'Simon & Schuster'),
	('The Unbearable Lightness of Being', 'Penguin Random House'),
	('Pet Cemetary', 'Pearson'),
	('The Tommyknockers', 'Pearson'),
	('A Clockwork Orange', 'Harper Collins'),
	('The Perks of Being a Wallflower', 'Simon & Schuster'),
	('The Man Without Qualities', 'Penguin Random House'),
	('Cloudy With a Chance of Meatballs', 'Harper Collins'),
	('Me Talk Pretty One Day', 'Pearson'),
	('John Dies at the End', 'Simon & Schuster'),
	('Where the Wild Things Are', 'Harper Collins'),
	('The Elephant Tree', 'Penguin Random House'),
	('One Hundred Years of Solitude', 'Pearson'),
	('The Long Dark Tea-Time of the Soul', 'Simon & Schuster'),
	('One Flew Over the Cuckoo''s Nest', 'Harper Collins'),
	('A Heartbreaking Work of Staggering Genius', 'Penguin Random House'),
	('Another Bullshit Night in Suck City', 'Pearson'),
	('Requiem for a Dream', 'Simon & Schuster'),
	('I Have No Mouth and I Must Scream', 'Harper Collins'),
	('So Long, and Thanks for All the Fish', 'Penguin Random House')
;

INSERT INTO tbl_book_authors
	(book_id, author_name)
VALUES
	(29, 'Phillip Dick'),
	(30, 'Douglas Adams'),
	(31, 'Ray Bradbury'),
	(32, 'Seth Smith'),
	(33, 'Steven King'),
	(34, 'Steven King'),
	(35, 'Sloane Crosley'),
	(36, 'Mark Haddon'),
	(37, 'Harper Lee'),
	(38, 'Robert Rankin'),
	(39, 'Lynne Truss'),
	(40, 'Milan Kundera'),
	(41, 'Chelsea Handler'),
	(42, 'Anthony Burgess'),
	(43, 'John Berendt'),
	(44, 'Stephen Chbosky'),
	(45, 'Robert Musil'),
	(46, 'Carolyn Mackler'),
	(47, 'Judi Barrett'),
	(48, 'Maurice Sendak'),
	(49, 'David Wond'),
	(50, 'David Sedaris')
;

INSERT INTO tbl_borrower
	([name], [Address], phone)
VALUES
	('Howard Forbes', '6210 1st ST CT NE', '253-922-9441'),
	('Harriette Graybeal', '675 South Main Street', '876-876-9854'),
	('Kaycee Won', '8765 Spear Lane S', '765-765-9908'),
	('Latisha Big', '3009 West Lindt', '876-321-4567'),
	('Peg Deangelo', '8765 Front Street', '675-876-9987'),
	('Blaine Williams', '123 Steering Ave', '876-453-9394'),
	('Lizbeth Mcnab', '3876 East Main', '990-876-7534'),
	('Willia Furlow', '8765 Molan Court', '765-876-9987')
;

INSERT INTO tbl_book_copies
	(book_id, branch_id, number_of_copies)
VALUES
	(29, 1, 2),
	(30, 1, 2),
	(31, 1, 2),
	(32, 1, 2),
	(33, 1, 2),
	(34, 1, 2),
	(35, 1, 2),
	(36, 1, 2),
	(37, 1, 2),
	(38, 1, 2),
	(39, 1, 2),
	(29, 2, 2),
	(30, 2, 2),
	(31, 2, 2),
	(32, 2, 2),
	(33, 2, 2),
	(34, 2, 2),
	(35, 2, 2),
	(36, 2, 2),
	(37, 2, 2),
	(38, 2, 2),
	(39, 2, 2),
	(29, 3, 2),
	(30, 3, 2),
	(31, 3, 2),
	(32, 3, 2),
	(33, 3, 2),
	(34, 3, 2),
	(35, 3, 2),
	(36, 3, 2),
	(37, 3, 2),
	(38, 3, 2),
	(39, 3, 2),
	(29, 4, 2),
	(30, 4, 2),
	(31, 4, 2),
	(32, 4, 2),
	(33, 4, 2),
	(34, 4, 2),
	(35, 4, 2),
	(36, 4, 2),
	(37, 4, 2),
	(38, 4, 2),
	(39, 4, 2)
;

INSERT INTO tbl_book_loans
	(book_id, branch_id, card_no, date_out, date_due)
VALUES
	(29, 1, 1, '2019-01-15', '2019-04-15'),
	(30, 1, 1, '2019-02-14', '2019-05-16'),
	(31, 1, 1, '2019-02-28', '2019-05-31'),
	(32, 1, 1, '2019-01-01', '2019-03-24'),
	(33, 1, 1, '2019-01-13', '2019-03-24'),
	(34, 1, 1, '2019-05-31', '2019-06-30'),
	(35, 1, 1, '2019-03-27', '2019-05-09'),
	(36, 1, 1, '2019-02-02', '2019-05-08'),
	(37, 1, 1, '2019-03-26', '2019-05-27'),
	(38, 1, 1, '2019-03-03', '2019-06-16'),
	(39, 1, 1, '2019-04-15', '2019-06-08'),
	(29, 2, 2, '2019-01-15', '2019-04-15'),
	(30, 2, 2, '2019-02-14', '2019-05-16'),
	(31, 2, 2, '2019-02-28', '2019-05-31'),
	(32, 2, 2, '2019-01-01', '2019-03-24'),
	(33, 2, 2, '2019-01-13', '2019-03-24'),
	(34, 2, 2, '2019-05-31', '2019-06-30'),
	(35, 2, 2, '2019-03-27', '2019-05-09'),
	(36, 2, 2, '2019-02-02', '2019-05-08'),
	(37, 2, 2, '2019-03-26', '2019-05-27'),
	(38, 2, 2, '2019-03-03', '2019-06-16'),
	(39, 2, 2, '2019-04-15', '2019-06-08'),
	(29, 3, 3, '2019-01-15', '2019-04-15'),
	(30, 3, 3, '2019-02-14', '2019-06-03'),
	(31, 3, 3, '2019-02-28', '2019-06-03'),
	(32, 3, 3, '2019-01-01', '2019-03-24'),
	(33, 3, 3, '2019-01-13', '2019-03-24'),
	(34, 3, 3, '2019-05-31', '2019-06-30'),
	(35, 3, 3, '2019-03-27', '2019-05-09'),
	(36, 3, 3, '2019-02-02', '2019-05-08'),
	(37, 3, 3, '2019-03-26', '2019-05-27'),
	(38, 3, 3, '2019-03-03', '2019-06-16'),
	(39, 3, 3, '2019-04-15', '2019-06-08'),
	(29, 4, 4, '2019-01-15', '2019-04-15'),
	(30, 4, 4, '2019-02-14', '2019-05-16'),
	(31, 4, 4, '2019-02-28', '2019-05-31'),
	(32, 4, 4, '2019-01-01', '2019-03-24'),
	(33, 4, 4, '2019-01-13', '2019-03-24'),
	(34, 4, 4, '2019-05-31', '2019-06-30'),
	(35, 4, 4, '2019-03-27', '2019-05-09'),
	(36, 4, 4, '2019-02-02', '2019-05-08'),
	(37, 4, 4, '2019-03-26', '2019-05-27'),
	(38, 4, 4, '2019-03-03', '2019-06-16'),
	(39, 4, 4, '2019-04-15', '2019-06-08'),
	(29, 1, 5, '2019-01-15', '2019-04-15'),
	(30, 1, 5, '2019-02-14', '2019-05-16'),
	(31, 1, 5, '2019-02-28', '2019-05-31'),
	(32, 1, 5, '2019-01-01', '2019-03-24'),
	(33, 1, 5, '2019-01-13', '2019-03-24'),
	(34, 1, 5, '2019-05-31', '2019-06-30'),
	(35, 1, 5, '2019-03-27', '2019-05-09'),
	(36, 1, 5, '2019-02-02', '2019-05-08'),
	(37, 1, 5, '2019-03-26', '2019-05-27'),
	(38, 1, 5, '2019-03-03', '2019-06-16'),
	(39, 1, 5, '2019-04-15', '2019-06-08')
;
GO


