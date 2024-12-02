#load necessary packages 
library(here)

#load data
here::i_am("code/01_make_output1.R")

dia_clean <- readRDS(
  file = here::here("dataset/dia_clean.RDS")
)

#bar graph for overall distribution of diabetes
dist_dia <-
  ggplot(dia_clean, aes(x = ifelse(isDiabetic == 1, "Diabetic", "Non Diabetic" ), 
             fill = ifelse(isDiabetic == 1, "Diabetic", "Non Diabetic" ))) +
  geom_bar(stat="count", alpha = 0.8) + 
  stat_count(geom = "text", color = "black", size = 3.5,
             aes(label = paste("n = ", ..count..)),
             position=position_stack(vjust=0.5)) +
  labs(title = "Distribution of diabetes", x= "", y= "", fill="is Diabetic")

#save plot to output folder
ggsave(
  here::here("output/bargraph.png"),
  device = "png"
)

saveRDS(dist_dia, file = here::here("output/bargraph.rds"))
