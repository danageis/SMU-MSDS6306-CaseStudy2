#######
# Talent Management
# Tiger Team - Case Study 2: Adil Siraj, Garrett Mozey, Dana Geislinger, & Luay Dajani
# for SMU MSDS 6306 Spring 2018
#######

# 2a
# Read raw data
dfm_attrition_data = read.csv("data/CaseStudy2-data.csv")

# Explore data structure and print number of data rows/columns
str(dfm_attrition_data)
cat(paste("Rows:\t",
          dim(dfm_attrition_data)[1],
          "\nColumns:",
          dim(dfm_attrition_data)[2]
          )
    )

# 2b-d
# Clean raw data names and shorten under 12 characters
names(dfm_attrition_data)[3] = "TravelFreq"
names(dfm_attrition_data)[6] = "Distance"
names(dfm_attrition_data)[8] = "EducField"
names(dfm_attrition_data)[9] = "Count"
names(dfm_attrition_data)[10] = "EmployeeNum"
names(dfm_attrition_data)[11] = "EnvironRate"
names(dfm_attrition_data)[14] = "JobInvolve"
names(dfm_attrition_data)[17] = "JobSatis"
names(dfm_attrition_data)[18] = "Marriage"
names(dfm_attrition_data)[19] = "MonIncome"
names(dfm_attrition_data)[21] = "NumCompany"
names(dfm_attrition_data)[24] = "PayIncPct"
names(dfm_attrition_data)[25] = "Performance"
names(dfm_attrition_data)[26] = "Relationship"
names(dfm_attrition_data)[27] = "StdHours"
names(dfm_attrition_data)[28] = "StockOption"
names(dfm_attrition_data)[29] = "YearsWorked"
names(dfm_attrition_data)[30] = "TrainLastYr"
names(dfm_attrition_data)[31] = "WorkLifeBal"
names(dfm_attrition_data)[32] = "YearsAtComp"
names(dfm_attrition_data)[33] = "YearsInPos"
names(dfm_attrition_data)[34] = "LstPromoted"
names(dfm_attrition_data)[35] = "YearsSprvsr"

# 2d
# Convert numeric categorical variables to factors
general_ratings = c("Low", "Medium", "High", "Very High")
dfm_attrition_data$EnvironRate = factor(dfm_attrition_data$EnvironRate, labels=general_ratings)
dfm_attrition_data$JobInvolve = factor(dfm_attrition_data$JobInvolve, labels=general_ratings)
dfm_attrition_data$JobSatis = factor(dfm_attrition_data$JobSatis, labels=general_ratings)

# 1/2 (Low/Medium) factors omitted, as nobody in data set ranked their performance lower than 3
dfm_attrition_data$Performance = factor(dfm_attrition_data$Performance,
                                        labels=c("Excellent", "Outstanding")
                                        )
dfm_attrition_data$Relationship = factor(dfm_attrition_data$Relationship, labels=general_ratings)
dfm_attrition_data$WorkLifeBal = factor(dfm_attrition_data$WorkLifeBal,
                                        labels=c("Bad", "Good", "Better", "Best")
                                        )
dfm_attrition_data$Education = factor(dfm_attrition_data$Education,
                                      labels=c("Below College", "College", "Bachelor", "Master", "Doctor")
                                      )
dfm_attrition_data$StockOption = factor(dfm_attrition_data$StockOption)

# 3b
# Select 7 relevant numeric variables for descriptive statistics table
dfm_nstats = dfm_attrition_data[, c("Age",
                                    "MonIncome",
                                    "PayIncPct",
                                    "Distance",
                                    "YearsWorked",
                                    "YearsAtComp",
                                    "LstPromoted",
                                    "YearsInPos"
                                    )
                                ]

# Print data.frame of descriptive statistics of 7 variables
dfm_desc_stats = as.data.frame(sapply(dfm_nstats, summary))
dfm_desc_stats

# Create histograms for Age and Monthly Income
par(mfrow=c(1,2))
hist(dfm_nstats$Age,
     main="Distribution of Age",
     xlab="Age"
     )
hist(dfm_nstats$MonIncome,
     main="Distribution of Monthly Income",
     xlab="Monthly Income"
     )

# Description (add as normal text in Rmd):
# Age appears fairly normally distributed about the mean with some slight right skew.
# Monthly Income appears heavily right skewed, and also appears bimodal at approximately 5,000 and 20,000.

# 3c
# Get frequency of Education, Gender and Occupation
dfm_factors = dfm_attrition_data[, c("Gender",
                                     "Education",
                                     "JobRole"
                                     )
                                 ]
list_freq = sapply(sapply(dfm_factors, table), prop.table)
dfm_gender_freq = as.data.frame(list_freq[1])
dfm_educ_freq = as.data.frame(list_freq[2])
dfm_occup_freq = as.data.frame(list_freq[3])
names(dfm_gender_freq) = c("Gender", "Frequency")
names(dfm_educ_freq) = c("EducationLevel", "Frequency")
names(dfm_occup_freq) = c("JobTitle", "Frequency")
dfm_gender_freq
dfm_educ_freq
dfm_occup_freq

# Compare attrition rate betwen different groups of monthly income
salary_bins = c("0-5k", "5-10k", "10-15k", "15-20k")
dfm_attrition_data$IncLevels = cut(dfm_attrition_data$MonIncome,
                                   breaks=c(0, 5000, 10000, 15000, 20000),
                                   labels=salary_bins
                                   )
# Calculate % of employees attrition w/in salary groups
sal_counts = summary(dfm_attrition_data$IncLevels)
attrit_by_sal_pct = numeric()
for (level in salary_bins) {
  yes_attrit = length(dfm_attrition_data$IncLevels[dfm_attrition_data$Attrition == "Yes"
                                                   & dfm_attrition_data$IncLevels == level
                                                   ]
                      )
  attrit_by_sal_pct[level] = yes_attrit / sal_counts[level] * 100
}

# Plot results as a bar chart
par(mfrow=c(1,1))
barplot(attrit_by_sal_pct,
        ylim=c(0, 25),
        main="Attrition Rate by Salary Level",
        ylab="Attrition (% Yes)",
        xlab="Salary (Monthly Income)"
        )

# Comparing percent salary hike vs attrition
dfm_attrition_data$RaiseFactor = as.factor(dfm_attrition_data$PayIncPct)
raise_counts = summary(dfm_attrition_data$RaiseFactor)
attrit_by_raise_pct = numeric()
for (level in levels(dfm_attrition_data$RaiseFactor)) {
  yes_attrit = length(dfm_attrition_data$RaiseFactor[dfm_attrition_data$Attrition == "Yes"
                                                     & dfm_attrition_data$RaiseFactor == level
                                                     ]
                      )
  attrit_by_raise_pct[level] = yes_attrit / raise_counts[level] * 100
}

# Plot results as a scatterplot
plot(x=levels(dfm_attrition_data$RaiseFactor),
     y=attrit_by_raise_pct,
        ylim=c(0, 30),
        main="Attrition Rate by Raise Percentage",
        ylab="Attrition (% Yes)",
        xlab="Price Increase (%)"
)

## Function to quickly find frequencies for unique values and associated attrition
## Create Funciton to find Frequency vs Attrition to put on a table later
fun_findfreq <- function(str_column, dfm_input){
  vec_attr_rates = vector()
  dfm_output_freq = data.frame()
  # find total observations
  total = length(dfm_input[dfm_input[,str_column]])
  # find unique entries
  vec_uniquevalues = summary(dfm_input[,str_column])
  names(vec_uniquevalues)
  # set the frequency of the unique entries in teh dataframe
  dfm_output_freq = as.data.frame(names(vec_uniquevalues))
  colnames(dfm_output_freq) = str_column; 
  dfm_output_freq["Frequency"] = round(vec_uniquevalues/total, digits = 2)
  
  # for loop to find attrition
  for (element in dfm_output_freq[,str_column]){
    int_temp_attr = length(dfm_input[dfm_input[,str_column] == element & 
                                       dfm_input$Attrition == "Yes"
                                     ,str_column])
    int_temp_attr_perc = int_temp_attr / 
      length(dfm_input[dfm_input[,str_column] == element, str_column])
    vec_attr_rates = c(vec_attr_rates, int_temp_attr_perc)
  }
  # Add attrition stats in dataframe
  dfm_output_freq["Attrition"] = round(vec_attr_rates, digits = 2)
  return(dfm_output_freq)
}

## Get & Set Attrition for Occupation
dfm_jobsatis_freq = data.frame()
dfm_jobsatis_freq = fun_findfreq("JobSatis", dfm_attrition_data)

## Get & Set Attrition for Performance
dfm_performance_freq = data.frame()
dfm_performance_freq = fun_findfreq("Performance", dfm_attrition_data)

## Get & Set Attrition for Gender
dfm_gender_freq = data.frame()
dfm_gender_freq = fun_findfreq("Gender", dfm_attrition_data)

## Get & Set Attrition for Education
dfm_educ_freq = data.frame()
dfm_educ_freq = fun_findfreq("Education", dfm_attrition_data)

## Get & Set Attrition for Education
dfm_occup_freq = data.frame()
dfm_occup_freq = fun_findfreq("JobRole", dfm_attrition_data)

## Get & Set Attrition for Job Level
dfm_joblevel_freq = data.frame()
dfm_joblevel_freq = fun_findfreq("JobLevel", dfm_attrition_data)

## Get & Set Attrition for Stock Option
dfm_stockoption_freq = data.frame()
dfm_stockoption_freq = fun_findfreq("StockOption", dfm_attrition_data)

## Get & Set Attrition for Job Involvement
dfm_jobinvolve_freq = data.frame()
dfm_jobinvolve_freq = fun_findfreq("JobInvolve", dfm_attrition_data)






