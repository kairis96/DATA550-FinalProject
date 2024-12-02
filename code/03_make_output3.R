#relative file path
here::i_am("code/01_make_output1.R")

#load data
dia_clean <- readRDS(
  file = here::here("dataset/dia_clean.RDS")
)

library(ggplot2)

#scatterplot to show the relationship between age and BMI
scatterplot <- ggplot(dia_clean, aes(x=Age, y=BMI, color=isDiabetic)) + 
  geom_jitter(alpha=0.6) + 
  geom_smooth(method='loess', se=FALSE) +
  scale_color_manual(values=c("0"="lightblue", "1"="lightcoral")) +
  labs(title="Age vs BMI by Diabetes Status", x="Age", y="BMI") +
  theme_minimal()

#save plot to output folder 
ggsave(
  here::here("output/scatterplot.png"),
  device = "png"
)
