USE [Library]
GO
CREATE PROCEDURE dbo.Query5
AS
SELECT Count(*) AS [Book Loans], lb.branch_name AS [Branch Name]
FROM tbl_book_loans bl
INNER JOIN tbl_library_branch lb ON bl.branch_id = lb.branch_id
GROUP BY lb.branch_name
GO

