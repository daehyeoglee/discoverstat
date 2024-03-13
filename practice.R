# Fig 3-1

rtData <- read.delim("ddd.dat", header = TRUE)
head(rtData)

TNT <- factor(rtData$TNT, labels = c('notarget','target'))
trial <- factor(rtData$trial, labels = c('tb1','tb2','tb3','tb4','tb5','tb6'))
NR_R <- factor(rtData$NR_R, labels = c('norule','rule'))
library(Rcmdr)

# Graph the data
library(ggplot2)
scatter <- ggplot(rtData, aes(trial, rt))
scatter +
  geom_point() +
  suppressWarnings(
    geom_smooth(method = "lm", aes(fill = NR_R), color = "Red")
    ) +
  labs(x = "Trial bins", y = "Reaction time")

rtModel <- lm(
  rt ~ NR_R + trial + TNT + NR_R:TNT, data = rtData,
)
summary(rtModel)


# Fig 3-2

rtData2 <- read.delim("dd2.dat", header = TRUE)
head(rtData)

TNT2 <- factor(TNT, labels = c('notarget','target'))
trial2 <- factor(trial, labels = c('tb1','tb2','tb3','tb4','tb5','tb6'))
NR_R2 <- factor(NR_R, labels = c('norule','rule'))

scatter2 <- ggplot(rtData2, aes(trial2, rt))
scatter2 +
  geom_point() +
  suppressWarnings(
    geom_smooth(method = "lm", aes(fill = NR_R2), color = "Red")
  ) +
  labs(x = "Trial bins", y = "Reaction time")

rtModel2 <- lm(
  rt ~ NR_R2 + trial2 + TNT2 + NR_R2:TNT2, data = rtData2,
)
summary(rtModel2)
