library(dplyr)

setwd("C:/Users/Tim/Desktop/FIT5120/Project")

ds <- read.csv('sport_e2_filtered.csv')

ds_male <- ds %>% 
  filter(sex == 'm') %>%
  group_by(sport) %>%
  summarise(age_avg = mean(age))

ds_female <- ds %>% 
    filter(sex == 'f') %>%
  group_by(sport) %>%
    summarise(age_avg = mean(age))

ages = seq(1,50,1)
male_sports = rep('Basketball', 50)
female_sports = rep('Basketball', 50)

which(abs(ds_male$age_avg - age)==min(abs(ds_male$age_avg - age)))

i = 0
for (age in ages) {
  i = i + 1
  male_sport_index <- which(abs(ds_male$age_avg - age)==min(abs(ds_male$age_avg - age)))
  female_sport_index <- which(abs(ds_female$age_avg - age)==min(abs(ds_female$age_avg - age)))
  
  male_sports[i] <- ds_male$sport[male_sport_index]
  female_sports[i] <- ds_female$sport[female_sport_index]
}

ds <- data.frame(ages, male_sports, female_sports)


write.table(ds, file = 'sports_grouped.csv', 
            row.names = F,
            sep = ",")
