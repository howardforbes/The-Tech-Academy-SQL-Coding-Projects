USE [Library]
GO
CREATE PROCEDURE dbo.Query3
AS
SELECT DISTINCT b.name, b.card_no
FROM tbl_borrower b
LEFT OUTER JOIN tbl_book_loans bl ON b.card_no = bl.card_no
WHERE b.card_no NOT IN (SELECT card_no FROM tbl_book_loans); 
GO

