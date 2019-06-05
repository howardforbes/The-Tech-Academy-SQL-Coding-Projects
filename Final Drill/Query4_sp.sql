USE [Library]
GO
CREATE PROCEDURE dbo.Query4
AS
SELECT b.title, brw.name, brw.address 
FROM tbl_book_loans bl
INNER JOIN tbl_library_branch lb ON bl.branch_id = lb.branch_id
INNER JOIN tbl_borrower brw ON bl.card_no = brw.card_no
INNER JOIN tbl_books b ON b.book_id = bl.book_id
WHERE lb.branch_name = 'Sharpstown' AND bl.date_due = CONVERT(VARCHAR(10),GETDATE(),111)
GO

