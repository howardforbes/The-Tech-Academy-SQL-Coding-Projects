USE [Library]
GO
CREATE PROCEDURE dbo.Query2
AS
SELECT SUM(bc.number_of_copies) [Number Of Copies], lb.branch_name AS [Branch Name]
FROM tbl_book_copies bc
INNER JOIN tbl_books b ON bc.book_id = b.book_id
INNER JOIN tbl_library_branch lb ON lb.branch_id = bc.branch_id
WHERE b.title = 'The Lost Tribe'
GROUP BY lb.branch_name;
GO

