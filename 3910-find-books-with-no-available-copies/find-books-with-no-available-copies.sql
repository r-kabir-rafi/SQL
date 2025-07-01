-- Write your PostgreSQL query statement below

SELECT 
    lb.book_id, 
    lb.title, 
    lb.author, 
    lb.genre, 
    lb.publication_year, 
    COUNT(br.record_id) current_borrowers
FROM library_books AS lb
LEFT JOIN borrowing_records as br
    ON lb.book_id = br.book_id
WHERE 
    br.return_date IS NULL
GROUP BY 
    lb.book_id, lb.title, lb.author, lb.genre, lb.publication_year, lb.total_copies
HAVING 
    COUNT(br.record_id) = lb.total_copies
ORDER BY 
    current_borrowers DESC, lb.title ASC;
