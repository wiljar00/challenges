-- Improved vote counting query - Option 1: Using CTE for clarity
WITH vote_totals AS (
    SELECT 
        c.state,
        c.first_name,
        c.last_name,
        COUNT(r.id) as vote_count
    FROM candidates c 
    JOIN results r ON c.id = r.candidate_id
    GROUP BY c.state, c.first_name, c.last_name
)
SELECT 
    state,
    GROUP_CONCAT(
        CONCAT(first_name, ' ', last_name, ' x ', vote_count)
        ORDER BY vote_count DESC, first_name ASC, last_name ASC 
        SEPARATOR ','
    ) as results
FROM vote_totals
GROUP BY state 
ORDER BY state ASC;

-- Option 2: More explicit with better formatting
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
    INNER JOIN results r ON c.id = r.candidate_id 
    GROUP BY c.state, c.first_name, c.last_name
) vote_totals
GROUP BY state 
ORDER BY state ASC;

-- Option 3: Using window functions (if you need more complex sorting)
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
        COUNT(r.id) as vote_count,
        ROW_NUMBER() OVER (PARTITION BY c.state ORDER BY COUNT(r.id) DESC, c.first_name ASC, c.last_name ASC) as rn
    FROM candidates c 
    INNER JOIN results r ON c.id = r.candidate_id 
    GROUP BY c.state, c.first_name, c.last_name
) vote_totals
GROUP BY state 
ORDER BY state ASC;
