install.packages("tidyverse")
library("tidyverse")
penguins <- read.table("Data/penguin_data.txt", header=T) #read in data
glimpse(penguins)

#run a linear regression
model1 <- lm(body_mass_g ~ flipper_length_mm, data = penguins)
summary(model1)

#create a buce plot in ggplot2
ggplot(penguins, aes(x= flipper_length_mm, y = body_mass_g, colour = species)) +
  geom_point() +
  stat_smooth(method = "lm")

ggsave("figs/1_flipper_bodymass_regression.png")

#subset the data
penguins_female <- subset(penguins, sex == "female")

#save the edited dataset
write_tsv(penguins_female, "results/1_penguin_female_only.txt")

x <- 1:10
