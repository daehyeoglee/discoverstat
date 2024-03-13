### 3.4. Using R
metallica <- c("Lars", "James", "Jason", "Kirk")
metallica
metallica <- metallica[metallica != "Jason"]
metallica
metallica <- c(metallica, "Rob")
metallica
jeonlab <- c("prof_Jeon", "HD", "TH", "MH", "JT")
jeonlab
jeonlab <- c(jeonlab, "DH")
jeonlab
jeonlab <- jeonlab[jeonlab != "DH"]
jeonlab
jeonlab <- c("DH", jeonlab)
jeonlab
# 3.4.6. Getting help
help(c)
?c

### 3.5. Getting data into R
# 3.5.1. Creating variables
metallicaNames <- c("Lars", "James", "Kirk", "Rob")
metallicaAges <- c(47, 47, 48, 46)
# 3.5.2. Creating dataframes
metallica <- data.frame(Name = metallicaNames, Age = metallicaAges)
metallica
metallica$Age
metallica$Name
metallica$childAge <- c(12, 12, 4, 6)
metallica
names(metallica)
metallicalist <- list(metallicaNames, metallicaAges)
metallicalist
metallica
metallicacbind <- cbind(metallicaNames, metallicaAges)
metallicacbind
# 3.5.3. Calculating new variables from existing ones
metallica$fatherhoodAge <- metallica$Age - metallica$childAge
metallica
# 3.5.4. Organizing your data
name <- c("Ben", "Martin", "Andy", "Paul", "Graham", "Carina", "Karina", "Doug", "Mark", "Zoe")
husband <- c("1973-06-21", "1970-07-16", "1949-10-08", "1969-05-24")
wife <- c("1984-11-12", "1973-08-02", "1948-11-11", "1983-07-23")
agegap <- husband - wife  #Birth dates are not recognized as date. They are still words.
husband <- as.Date(c("1973-06-21", "1970-07-16", "1949-10-08", "1969-05-24"))
wife <- as.Date(c("1984-11-12", "1973-08-02", "1948-11-11", "1983-07-23"))
agegap <- husband - wife
agegap
birth_date <- as.Date(c("1977-07-03", "1969-05-24", "1973-06-21", "1970-07-16", "1949-10-10", 
                        "1983-11-05", "1987-10-08", "1989-09-16", "1973-05-20", "1984-11-12"))
job <- c(1,1,1,1,1,2,2,2,2,2)
job <- c(rep(1, 5), rep(2, 5))
job
job <- factor(job, levels = c(1:2), labels = c("Lecturer", "Student"))
job <- gl(2, 5, labels = c("Lecturer", "Student"))
job
levels(job)
levels(job) <- c("Lecturer", "Student")
levels(job)
friends <- c(5, 2, 0, 4, 1, 10, 12, 15, 12, 17)
alcohol <- c(10, 15, 20, 5, 30, 25, 20, 16, 17, 18)
income <- c(20000, 40000, 3500, 22000, 50000, 50000, 100, 3000, 10000, 10)
neurotic <- c(10, 17, 14, 13, 21, 7, 13, 9, 14, 13)
lecturerData <- data.frame(name, birth_date, job, friends, alcohol, income, neurotic)
lecturerData
### 3.7. Using other software to enter and edit data
lecturerData = read.csv("~/Desktop/Lecturer Data.csv", header = TRUE)
lecturerData
### 3.8. Saving data
write.table(metallica, "Metallica Data.txt", sep = "\t", row.names = FALSE)
write.csv(metallica, "Metallica Data.csv")
### 3.9. Manipulating data
# 3.9.1. Selecting parts of a dataframe
lecturerPersonality <- lecturerData[, c("friends", "alcohol", "neurotic")]
lecturerPersonality
lecturerOnly <- lecturerData[job == "Lecturer",]
lecturerOnly
alcoholPersonality <- lecturerData[alcohol > 10, c("friends", "alcohol", "neurotic")]
alcoholPersonality
# 3.9.2. Selecting data with the subset() function
lecturerOnly <- subset(lecturerData, job == "Lecturer")
alcoholPersonality <- subset(lecturerData, alcohol > 10, select = c("friends", "alcohol", "neurotic"))
lecturerOnly
alcoholPersonality
#selfTest
highIncome <- subset(lecturerData, income >= 10000, select = c("name", "income", "job"))
highIncome
lessDrinker <- subset(lecturerData, alcohol <= 12, select = c("name", "job", "income", "friends"))
lessDrinker
drinkAndNeuro <- subset(lecturerData, alcohol >= 20 | neurotic >= 14, select = c("name", "birth_date", "job", "friends",
                                                                                "alcohol", "income", "neurotic"))
drinkAndNeuro
# 3.9.3. Dataframes and matrices
alcoholPersonalityMatrix <- as.matrix(alcoholPersonality)
alcoholPersonalityMatrix
alcoholPersonalityMatrix <- as.matrix(lecturerData[alcohol > 10, c("friends", "alcohol", "neurotic")])
alcoholPersonalityMatrix
# 3.9.4. Reshaping data
satisfactionData = read.delim(file.choose(), header = TRUE)
satisfactionData
satisfactionStacked <- stack(satisfactionData, select = c("Satisfaction_Base", "Satisfaction_6_Months", 
                                                          "Satisfaction_12_Months", "Satisfaction_18_Months"))
satisfactionStacked
satisfactionUnstacked <- unstack(satisfactionStacked, values ~ ind)
satisfactionUnstacked
restructuredData <- melt(satisfactionData, id = c("Person", "Gender"), measured = c("Satisfaction_Base", "Satisfaction_6_Months", 
                                                                                     "Satisfaction_12_Months", "Satisfaction_18_Months"))
restructuredData
wideData <- cast(restructuredData, Person + Gender ~ variable, value = "value")
wideData
