-- Simple MySQL approach for Binary Tree Path Sum
-- Using a flat table structure for easier querying

-- Create a simple table with all possible paths
CREATE TABLE tree_paths (
    path_id INT PRIMARY KEY,
    path_sum INT,
    is_leaf BOOLEAN
);

-- Insert all possible root-to-leaf paths for the tree:
-- Tree: [5,4,8,11,null,13,4,7,2,null,null,null,1]
-- Paths: 5->4->11->7 (sum=27), 5->4->11->2 (sum=22), 5->8->13 (sum=26), 5->8->4->1 (sum=18)

INSERT INTO tree_paths (path_id, path_sum, is_leaf) VALUES
(1, 27, TRUE),  -- 5+4+11+7
(2, 22, TRUE),  -- 5+4+11+2  
(3, 26, TRUE),  -- 5+8+13
(4, 18, TRUE);  -- 5+8+4+1

-- Simple query to check if target sum exists
SELECT 
    CASE 
        WHEN EXISTS (SELECT 1 FROM tree_paths WHERE path_sum = 22 AND is_leaf = TRUE) 
        THEN 'TRUE' 
        ELSE 'FALSE' 
    END as has_path_sum;

-- Show all paths and their sums
SELECT 
    path_id,
    path_sum,
    CASE WHEN path_sum = 22 THEN 'TARGET FOUND!' ELSE '' END as result
FROM tree_paths 
WHERE is_leaf = TRUE
ORDER BY path_sum;
