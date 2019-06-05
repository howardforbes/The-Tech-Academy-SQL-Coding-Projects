-- Query 1
SELECT SUM(bc.number_of_copies) [Number Of Copies]
FROM tbl_book_copies bc
INNER JOIN tbl_books b ON bc.book_id = b.book_id
INNER JOIN tbl_library_branch lb ON lb.branch_id = bc.branch_id
WHERE b.title = 'The Lost Tribe' AND lb.branch_name = 'Sharpstown';

-- Query 2
SELECT SUM(bc.number_of_copies) [Number Of Copies], lb.branch_name AS [Branch Name]
FROM tbl_book_copies bc
INNER JOIN tbl_books b ON bc.book_id = b.book_id
INNER JOIN tbl_library_branch lb ON lb.branch_id = bc.branch_id
WHERE b.title = 'The Lost Tribe'
GROUP BY lb.branch_name;

-- Query 3
SELECT DISTINCT b.name, b.card_no
FROM tbl_borrower b
LEFT OUTER JOIN tbl_book_loans bl ON b.card_no = bl.card_no
WHERE b.card_no NOT IN (SELECT card_no FROM tbl_book_loans); 

-- Query 4
SELECT b.title, brw.name, brw.address 
FROM tbl_book_loans bl
INNER JOIN tbl_library_branch lb ON bl.branch_id = lb.branch_id
INNER JOIN tbl_borrower brw ON bl.card_no = brw.card_no
INNER JOIN tbl_books b ON b.book_id = bl.book_id
WHERE lb.branch_name = 'Sharpstown' AND bl.date_due = CONVERT(VARCHAR(10),GETDATE(),111)

-- Query 5
SELECT Count(*) AS [Book Loans], lb.branch_name AS [Branch Name]
FROM tbl_book_loans bl
INNER JOIN tbl_library_branch lb ON bl.branch_id = lb.branch_id
GROUP BY lb.branch_name

-- Query 6
SELECT Count(*) AS [Number Of Books], b.name, b.address
FROM tbl_book_loans bl
INNER JOIN tbl_borrower b ON bl.card_no = b.card_no
GROUP BY b.name, b.address
HAVING Count(*) > 5

-- Query 7
SELECT b.title, SUM(number_of_copies) AS [Number Of Copies]
FROM tbl_book_copies bc
INNER JOIN tbl_books b ON bc.book_id = b.book_id
INNER JOIN tbl_book_authors a ON bc.book_id = a.book_id
INNer JOIN tbl_library_branch lb ON bc.branch_id = lb.branch_id
WHERE a.author_name = 'Steven King' AND lb.branch_name = 'Central'
GROUP BY b.title


