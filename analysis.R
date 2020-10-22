
# reading in the chaff.txt data

chaff <- read.table("./data/chaff.txt", header = T)

# reformatting the data into tidy format and writing to file

library(tidyverse)

tidy_chaff <- chaff %>%
  pivot_longer(names_to = "sex", 
               values_to = "mass",
               cols = everything())

file <-  "./data/tidy_chaff.txt"
write.table(tidy_chaff, 
            file, 
            quote = FALSE,
            row.names = FALSE)

# summarise and analyse - whether there is a difference in mass between male and female chaffinches

summary_chaff <- tidy_chaff %>% group_by(sex) %>%
  summarise(mean = mean(mass), 
            n = length(mass),
            sd = sd(mass))
