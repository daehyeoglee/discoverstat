### Task_2 original ###
studentNum <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20")
gender <- c(rep(1, 10), rep(2, 10))
gender <- factor(gender, levels = c(1:2), labels = c("Male", "Female"))
electricShock <- c(15, 14, 20, 13, 13, NA, NA, NA, NA, NA, 6, 7, 5, 4, 8, NA, NA, NA, NA, NA)
beingNice <- c(NA, NA, NA, NA, NA, 10, 9, 8, 8, 7, NA, NA, NA, NA, NA, 12, 10, 7, 8, 13)
scores <-data.frame(studentNum, gender, electricShock, beingNice)
scores

### Task_3 ###
subjectNum <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", 
               "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24")
genders <- c(rep(1, 12), rep(2, 12))
genders <- factor(genders, levels = c(1:2), labels = c("Male", "Female"))
PF <- c(69, 76, 70, 76, 72, 65, 82, 71, 71, 75, 52, 34, 70, 74, 64, 43, 51, 93, 48, 51, 74, 73, 41, 84)
OF <- c(33, 26, 10, 51, 34, 28, 27, 9, 33, 11, 14, 46, 97, 80, 88, 100, 100, 58, 95, 83, 97, 89, 69, 82)
bullets <- data.frame(subjectNum, genders, PF, OF)
bullets


### Task_2 revised ###
sbj <- c("1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20")
treated <- c(rep(1, 10), rep(2, 10))
treated <- factor(treated, levels = c(1:2), labels = c("electricShock", "beingNice"))
gend <- c(rep(1, 5), rep(2, 5), rep(1, 5), rep(2, 5))
gend <- factor(gend, levels = c(1:2), labels = c("Male", "Female"))
score <- c(15, 15, 20, 13, 13, 6, 7, 5, 4, 8, 10, 9, 8, 8, 7, 12, 10, 7, 8, 13)
result <- data.frame(sbj, treated, gend, score)
result
