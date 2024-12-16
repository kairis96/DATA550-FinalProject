#relative file path
here::i_am("code/02_make_output2.R")

library(ggplot2)

#load data
dia_clean <- readRDS(
  file = here::here("dataset/dia_clean.RDS")
)


#bar graph to show diabetes and blood pressure
dia_clean |> 
  ggplot(aes(x = ifelse(isDiabetic == 1, "Diabetic", "Non Diabetic" ), 
             fill = ifelse(HighBP == 1, "High", "Normal"))) +
  geom_bar(stat="count", alpha = 0.8) + 
  stat_count(geom = "text", colour = "black", size = 3.5,
             aes(label = paste("n = ", ..count..)),
             position=position_stack(vjust=0.5)) +
  labs(title = "High BP vs Diabetes", x= "", y= "", fill="Blood Pressure")

#save plot to output folder
ggsave(
  here::here("output/stackbargraph.png"),
  device = "png"
)
