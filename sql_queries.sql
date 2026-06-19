Total Students
SELECT COUNT(*) AS Total_Students
FROM Placement_Data_Full_Class;

-- Placement Distribution
SELECT status,
COUNT(*) AS Student_Count
FROM Placement_Data_Full_Class
GROUP BY status;

-- Work Experience vs Placement Status
SELECT workex,
status,
COUNT(*) AS Student_Count
FROM Placement_Data_Full_Class
GROUP BY workex, status
ORDER BY workex;

-- Average Salary by Specialisation
SELECT specialisation,
AVG(salary) AS Avg_Salary
FROM Placement_Data_Full_Class
WHERE status = 'Placed'
GROUP BY specialisation;

-- MBA Percentage vs Salary
SELECT mba_p,
salary,
specialisation
FROM Placement_Data_Full_Class
WHERE status = 'Placed';

-- Degree Percentage vs Salary
SELECT degree_p,
salary,
specialisation
FROM Placement_Data_Full_Class
WHERE status = 'Placed';

-- Placement Rate
SELECT
ROUND(
100.0 * SUM(CASE WHEN status='Placed' THEN 1 ELSE 0 END)
/ COUNT(*),
2
) AS Placement_Rate
FROM Placement_Data_Full_Class;

-- Salary Statistics
SELECT
MIN(salary) AS Min_Salary,
MAX(salary) AS Max_Salary,
AVG(salary) AS Avg_Salary
FROM Placement_Data_Full_Class
WHERE status='Placed';

-- Specialisation Wise Placement Count
SELECT
specialisation,
COUNT(*) AS Placed_Students
FROM Placement_Data_Full_Class
WHERE status='Placed'
GROUP BY specialisation;