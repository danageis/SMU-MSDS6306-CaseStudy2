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