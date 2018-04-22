# Codebook for Case Study 2

### Directories
* **Data:** Contains all raw data files used in the study
* **Image:** Contains image files for the slides

### Variables
**dfm_attrition_data:** (data.frame) All attrition data parsed from the raw data provided for this study.
* **Age:** The age of the employee in years. Any employees under 18 were removed from the dataset.
* **Attrition:** Whether or not the employee voluntarily resigned from the company (yes if they did, no otherwise).
* **TravelFreq:** (Originally BusinessTravel) The relative frequency of time spent traveling for business by the employee. Can be none (Non-Travel), frequent (Travel-Frequently), or rarely (Travel-Rarely).
* **Daily Rate:** Rate of pay on a daily scale.
* **Department:** Department in which employee works. Either Sales, Research and Development, or Human Resources.
* **Distance:** (Originally DistanceFromHome) Distance employees must commute from home to work.
* **Education:** Numeric category (1-5) describing education level. 1 is high school or lower, 2 is some college, 3 is bachelor’s degree, 4 is master’s degree, and 5 is PhD.
* **EducField:** (Originally EducationField) Field in which the employee pursued their education. Either Human Resources, Life Sciences, Marketing, Medical, Technical Degree, or Other.
* **Count:** (Originally EmployeeCount) Meaning of this variable is unclear. It is 1 for every employee in the provided dataset.
* **EmployeeNum:** (Originally EmployeeNumber) Unique numeric ID for each employee.
* **EnvironRate:** (Originally EnvironmentSatisfaction) Rating of environmental satisfaction from 1 (low) to 4 (very high).
* **Gender:** Gender of employee (male or female).
* **HourlyRate:** Rate of pay on an hourly scale.
* **JobInvolve:** (Originally JobInvolvement) Rating of job involvement on a 1 (low) to 4 (very high) scale.
* **JobLevel:** Ranking of the employee’s job level on a scale of 1 to 5.
* **JobRole:** The employee’s job title. Employees with one of nine jobs are included in this data set.
* **JobSatis:** (Originally JobSatisfaction) Job satisfaction rating on scale of 1 (low) to 4 (very high).
* **Marriage:** (Originally MaritalStatus) Marital status of employee (Single, Married, or Divorced).
* **MonIncome:** (Originally MonthlyIncome) Monthly income of employee.
* **MonthlyRate:** Pay rate of employee on monthly scale.
* **NumCompany:** (Originally NumCompaniesWorked) The number of companies the employee has worked for.
* **Over18:** Whether or not (Y or N) the employee is over 18 years old. All minors were removed from this dataset, so this data is irrelevant for our purposes.
* **OverTime:** Whether or not the employee works overtime.
* **PayIncPct:** (Originally PercentSalaryHike) The percentage increase in an employee’s salary, presumably as part of an annual raise.
* **Performance:** (Originally PerformanceRating) Rating of performance on a scale of 1 (low) to 4 (very high). This is assumed to be a self-rating because all ratings are either 3 or 4.
* **Relationship:** (Originally RelationshipSatisfaction) Rating of relationship satisfaction on a scale of 1 (low) to 4 (very high).
* **StdHours:** (Originally StandardHours) Typical number of work hours in a 2-week period, barring overtime. 80 hours are expected for all employees in the dataset.
* **StockOption:** (Originally StockOptionLevel) Rating of stock options offered to employees on a scale of 0 (none) to 3.
* **YearsWorked:** (Originally TotalWorkingYears) The number of years the employee has been working in their life.
* **TrainLastYr:** (Originally TrainingTimesLastYear) The number of times the employee was trained jn the past year.
* **WorkLifeBal:** (Originally WorkLIfeBalance) Rating of the employee’s work to life balance on a scale of 1 (bad) to 4 (best).
* **YearsAtComp:** (Originally YearsAtCompany) The number of years the employee has been with their current employer.
* **YearsInPos:** (Originally YearsInCurrentRole) The number of years the employee has been working in their current position.
* **LstPromoted:** (Originally YearsSinceLastPromotion) The number of years since the employee’s last promotion.
* **YearsSprvsr:** (Originally YearsWithCurrManager) The number of years the employee has been working under their current manager.

**general_ratings:** (character vector) List of strings typically used as levels for categorical variables in the dataset.
**dfm_nstats:** (data.frame) Subset of dfm_attrition_data that will be used for descriptive statistics table.
**dfm_desc_stats:** (data.frame) Descriptive statistics (minimum, 1st quartile, median, mean, 3rd quartile, and maximum) for dfm_nstats.
**dfm_factors:** (data.frame) Subset of dfm_attrition_data with categorical variables of interest.
**list_freq:** (list) Frequency of levels in dfm_factors.
**dfm_gender_freq:** (data.frame) Frequency of gender in the dataset.
**dfm_educ_freq:** (data.frame) Frequency of each education level in the dataset.
**dfm_occup_freq:** (data.frame) Frequency of each job title in the dataset.