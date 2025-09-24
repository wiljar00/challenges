-- Vote counting query with proper formatting and sorting
-- Groups candidates by state, counts votes, and formats output

SELECT 
    state,
    GROUP_CONCAT(
        CONCAT(first_name, ' ', last_name, ' x ', vote_count) 
        ORDER BY vote_count DESC, first_name ASC, last_name ASC
        SEPARATOR ','
    ) as results
FROM (
    SELECT 
        c.state,
        c.first_name,
        c.last_name,
        COUNT(r.id) as vote_count
    FROM candidates c 
    JOIN results r ON c.id = r.candidate_id
    GROUP BY c.state, c.first_name, c.last_name
) as vote_totals
GROUP BY state
ORDER BY state ASC;
