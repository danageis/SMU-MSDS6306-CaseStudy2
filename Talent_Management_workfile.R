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

# 2b
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
