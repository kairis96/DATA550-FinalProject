#load necessary packages 
install.packages("ggplot2")
library(ggplot2)
library(here)

here("dataset", "diabetes_012_health_indicators_BRFSS2015.csv")
dia_clean <- readr::read_csv(here("dataset", "diabetes_012_health_indicators_BRFSS2015.csv"))
#overall distribution of diabetes
dist_dia <-
  ggplot(dia_clean, aes(x = ifelse(isDiabetic == 1, "Diabetic", "Non Diabetic" ), 
             fill = ifelse(isDiabetic == 1, "Diabetic", "Non Diabetic" ))) +
  geom_bar(stat="count", alpha = 0.8) + 
  stat_count(geom = "text", color = "black", size = 3.5,
             aes(label = paste("n = ", ..count..)),
             position=position_stack(vjust=0.5)) +
  labs(title = "Distribution of diabetes", x= "", y= "", fill="is Diabetic")

print(dist_dia)

saveRDS(summary_stats, here("output", "summary_stats.rds"))