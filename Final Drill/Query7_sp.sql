USE [Library]
GO
CREATE PROCEDURE dbo.Query7
AS
SELECT b.title, SUM(number_of_copies) AS [Number Of Copies]
FROM tbl_book_copies bc
INNER JOIN tbl_books b ON bc.book_id = b.book_id
INNER JOIN tbl_book_authors a ON bc.book_id = a.book_id
INNer JOIN tbl_library_branch lb ON bc.branch_id = lb.branch_id
WHERE a.author_name = 'Steven King' AND lb.branch_name = 'Central'
GROUP BY b.title
GO

