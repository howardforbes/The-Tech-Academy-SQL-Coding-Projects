USE [Library]
GO
CREATE PROCEDURE dbo.Query6
AS
SELECT Count(*) AS [Number Of Books], b.name, b.address
FROM tbl_book_loans bl
INNER JOIN tbl_borrower b ON bl.card_no = b.card_no
GROUP BY b.name, b.address
HAVING Count(*) > 5
GO

