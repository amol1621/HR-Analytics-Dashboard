
 HR Analytics Dashboard - SQL Analysis Queries


 1. Total Employees
	Returns the total number of employees in the organization.
	Used for KPI Card: Total Employees
		
	SELECT COUNT(EmployeeNumber) AS Total_Employees
	FROM employee;


 2. Attrition Count
	Returns the total number of employees who left the company.
	Used to calculate Attrition Rate.
	
	SELECT COUNT(EmployeeNumber) AS Attrition_Count
	FROM employee
	WHERE Attrition = 'Yes';


 3. Attrition Rate
	Calculates the percentage of employees who left the company.
	Used for KPI Card: Attrition Rate

	SELECT
	ROUND(
	(COUNT(CASE WHEN Attrition='Yes' THEN 1 END)*100.0)
	/COUNT(*),2
	) AS Attrition_Rate
	FROM employee;


 4. Average Salary
	Calculates the average monthly salary of employees.
	Used for KPI Card: Average Salary

	SELECT ROUND(AVG(MonthlyIncome),2) AS Average_Salary
	FROM employee;


 5. Average Age
	Calculates the average age of employees.
	Used for KPI Card: Average Age

	SELECT ROUND(AVG(Age),2) AS Average_Age
	FROM employee;


 6. Average Job Satisfaction
	Calculates average employee job satisfaction.
	Used for KPI Card: Avg Job Satisfaction

	SELECT ROUND(AVG(JobSatisfaction),2) AS Average_Job_Satisfaction
	FROM employee;


 7. Average Experience
	Calculates average years employees have worked at the company.
	Used for KPI Card: Avg Experience

	SELECT ROUND(AVG(YearsAtCompany),2) AS Average_Experience
	FROM employee;


 8. Employees by Department
	Shows employee count in each department.
	Used for Department Analysis chart.

	SELECT
	Department,
	COUNT(*) AS Total_Employees
	FROM employee
	GROUP BY Department
	ORDER BY Total_Employees DESC;


 9. Average Salary by Department
	Compares average salary across departments.
	Used for Salary by Department chart.

	SELECT
	Department,
	ROUND(AVG(MonthlyIncome),2) AS Average_Salary
	FROM employee
	GROUP BY Department
	ORDER BY Average_Salary DESC;


 10. Attrition by Department
	Shows attrition count for each department.
	Used for Attrition by Department chart.

	SELECT
	Department,
	COUNT(*) AS Attrition_Count
	FROM employee
	WHERE Attrition='Yes'
	GROUP BY Department
	ORDER BY Attrition_Count DESC;


 11. Employees by Education Field
	Displays employee distribution across education fields.
	Used for Education Field donut chart.

	SELECT
	EducationField,
	COUNT(*) AS Total_Employees
	FROM employee
	GROUP BY EducationField
	ORDER BY Total_Employees DESC;


 12. Employees by Job Role
	Displays number of employees in each job role.
	Used for Job Role chart.

	SELECT
	JobRole,
	COUNT(*) AS Total_Employees
	FROM employee
	GROUP BY JobRole
	ORDER BY Total_Employees DESC;


 13. Business Travel Analysis
	Shows employee distribution based on travel frequency.
	Used for Business Travel donut chart.

	SELECT
	BusinessTravel,
	COUNT(*) AS Total_Employees
	FROM employee
	GROUP BY BusinessTravel
	ORDER BY Total_Employees DESC;


 14. Overtime vs Attrition
	Analyzes the relationship between overtime and employee attrition.
	Used for Overtime vs Attrition chart.

	SELECT
	OverTime,
	Attrition,
	COUNT(*) AS Employee_Count
	FROM employee
	GROUP BY OverTime, Attrition
	ORDER BY OverTime;

 15. Age Group Distribution
	Groups employees into age categories.
	Used for Age Group chart.

	SELECT
	CASE	
	    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
	    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
	    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
	    WHEN Age BETWEEN 46 AND 55 THEN '46-55'
	    ELSE '56+'
	END AS Age_Group,
	COUNT(*) AS Total_Employees
	FROM employee
	GROUP BY Age_Group
	ORDER BY Age_Group;

 16. Experience Distribution
	Groups employees by years at the company.
	Used for Experience Distribution chart.

	SELECT
	CASE
	    WHEN YearsAtCompany <=2 THEN '0-2 Years'
	    WHEN YearsAtCompany <=5 THEN '3-5 Years'
	    WHEN YearsAtCompany <=10 THEN '6-10 Years'
	    ELSE '10+ Years'
	END AS Experience_Group,
	COUNT(*) AS Total_Employees
	FROM employee
	GROUP BY Experience_Group
	ORDER BY Total_Employees DESC;