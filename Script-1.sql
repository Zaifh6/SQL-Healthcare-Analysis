-- You can download the dataset from this link
-- https://drive.google.com/file/d/1yUcIiw3MKnVptxPL5caergKlU5q-cQyf/view?usp=drive_link

-- lets explore the relation between heart disease count , age and gender to find some insights
SELECT gender, age, COUNT(*) AS heart_disease_count
FROM mytable
GROUP BY gender, age
order by heart_disease_count desc;

#1: There are 61 females who are 45 years old and have heart disease.
#2: It also appears that there are more females with heart disease compared to males with heart disease.

SELECT SUM(heart_disease_count) AS total_heart_disease_count
FROM (
  SELECT gender, age, COUNT(*) AS heart_disease_count
  FROM mytable
  WHERE age > 50
  GROUP BY gender, age
) AS subquery;

SELECT SUM(heart_disease_count) AS total_heart_disease_count
FROM (
  SELECT gender, age, COUNT(*) AS heart_disease_count
  FROM mytable
  WHERE age < 50
  GROUP BY gender, age
) AS subquery;

#3: People whose age is greater than 50 have a heart disease count of 2,127.
#4: People whose age is less than 50 have a heart disease count of 2,900.
#5: For people with older ages, such as those greater than 50, the heart disease count is also higher.

-- Q : Find married people who have heart disease

SELECT ever_married, heart_disease, COUNT(*) 
FROM mytable
where heart_disease = 1
GROUP BY ever_married, heart_disease;

#6 : There are 244 who were married and had a heart disease.

-- Q : What is the age range of the individuals in this data set?

SELECT MIN(age) AS min_age, MAX(age) AS max_age
FROM mytable;

#7 : Minimum Age = 1 & Maximum Age = 82

-- Q : How many males and females are included in the data set?

select gender, COUNT(*) from mytable m group by gender 

#8 : Female genders in data set : 2994 & Male genders in data set : 2115

-- Q : What is the average age of the individuals in the data set?

select AVG(age) from mytable m 

#9 : Average age in the data set : 43

-- How many individuals have a history of smoking?

select gender, smoking_status 
from mytable m 
where smoking_status = 'formerly smoked' AND gender = 'male'

#10 : There are 885 peoples in this dataset who have history of smoking.
#11 : Out of these 885 peoples 477 are females & 407 are males.


select gender, smoking_status 
from mytable m 
where smoking_status = 'never smoked' and gender = 'male'

#12 : There are 1892 peoples in this dataset who have never smoked.
#13 : Out of these 1892 peoples 1229 are females and 663 are males.
#14 : The Smoking ratio in the data set is 31.8%
	-- 	The smoking ratio was calculated as follows:
	-- 	Smoking Ratio = (Number of Individuals with a History of Smoking) / (Total Number of Individuals)
	-- 	Smoking Ratio = 885 / (885 + 1892) ≈ 0.318 (or 31.8%)
#15 : Female smoking ratio is 53.9%.
#16 : Male smoking ratio is 46.1%.
	-- 	The gender based smoking ratio was calculated as follows:
	-- 	Female Smoking Ratio = (Number of Females with a History of Smoking) / (Total Number of Individuals with a History of Smoking)
	-- 	Male Smoking Ratio = (Number of Males with a History of Smoking) / (Total Number of Individuals with a History of Smoking)
#17 : Female Non-Smoking ratio : 64.9%.
#18 : Male Non-Smoking ratio : 35.1%.
	-- 	You can calculate the gender-based non-smoking ratios as follows: 		
	-- 	Female Non-Smoking Ratio = (Number of Females who have Never Smoked) / (Total Number of Individuals who have Never Smoked)
	-- 	Male Non-Smoking Ratio = (Number of Males who have Never Smoked) / (Total Number of Individuals who have Never Smoked)
#19 : The remaining people of male and females and smoking status of unknown.

-- Q : What is the most common occupation among the individuals?

SELECT gender, work_type, COUNT(*) as count
FROM mytable
GROUP BY gender, work_type;

#20 : The most common occupation among the individuals both males and females is private work whil the least common is Never worked.

SELECT COUNT(*) AS missing_bmi_count
FROM mytable
WHERE bmi IS NULL;

-- The missing BMI count is 0

