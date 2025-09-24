-- MySQL query for device benchmarking tool
-- Returns formatted results showing device performance class

SELECT 
    CONCAT('Device ', id, ' has class: ', 
        CASE 
            WHEN score >= 80 THEN 'A'
            WHEN score >= 60 THEN 'B'
            WHEN score >= 40 THEN 'C'
            WHEN score >= 20 THEN 'D'
            ELSE 'F'
        END
    ) AS device
FROM devices
ORDER BY id ASC;
