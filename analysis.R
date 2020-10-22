
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

# visualising the summary data 

fig1 <- ggplot(summary_chaff, aes(x = sex, y = mean)) + 
  geom_errorbar(mapping = aes(ymin = mean - sd, ymax = mean + sd), width = 0.2) +
  geom_point() +
  xlab("Sex") +
  ylab("Mean Mass")

# figure saving settings
units <- "in"  
fig_w <- 3.5
fig_h <- fig_w
dpi <- 300
device <- "tiff" 


# saving the first figure to the figure folder

ggsave("./figures/fig1.tiff",
       plot = fig1,
       device = device,
       width = fig_w,
       height = fig_h,
       units = units,
       dpi = dpi)








# Making some changes 
fig2 <- ggplot(summary_chaff, aes(x = sex, y = mean, col= "red")) + 
  geom_errorbar(mapping = aes(ymin = mean - sd, ymax = mean + sd), width = 0.2) +
  geom_point() +
  xlab("Sex") +
  ylab("Mean Mass")



