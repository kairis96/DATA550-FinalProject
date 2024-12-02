#Diabetes and blood pressure
dia_clean |> 
  ggplot(aes(x = ifelse(isDiabetic == 1, "Diabetic", "Non Diabetic" ), 
             fill = ifelse(HighBP == 1, "High", "Normal"))) +
  geom_bar(stat="count", alpha = 0.8) + 
  stat_count(geom = "text", colour = "black", size = 3.5,
             aes(label = paste("n = ", ..count..)),
             position=position_stack(vjust=0.5)) +
  labs(title = "High BP vs Diabetes", x= "", y= "", fill="Blood Pressure")
