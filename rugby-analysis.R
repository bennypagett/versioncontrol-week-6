## Week 6 Activity - Version Control
###script for rugby analysis

library(readr) 
library(tidyverse)
library(ggplot2)
library(dplyr)

df <- read_csv("data/2017_super-rugby_try-source-data.csv") ## load dataframe - Rugby analysis
View(df)



head(df)
tail(df)
str(df)

```{r na}
sum(is.na(df)) # count the missing values
head(which(is.na(df), arr.ind = TRUE)) # find where the missing values are (showing only first 6 rows)
```


sum(is."0"(df))
nrow(0)
ncol(0)
head(which(is.0(df)), arr.ind = TRUE))


df[df == 0] <- NA ### replace 0's with NA

## exploratory graphs to visualise univariate distribution - frequency/histograms

df %>%
  ggplot(data = df) +
  geom_histogram(mapping = aes(x = attacking_team), fill = "blue", colour = "black", stat = "count",
                 binwidth = 1)
  df %>%
  ggplot(data = df) +
    geom_histogram(mapping = aes(x = attacking_team, fill = attacking_team), colour = "black",
                   stat = "count", binwidth = .5)

df %>%
  ggplot(data = df) +
  geom_bar(mapping = aes(x = attacking_team, fill = attacking_team), stat = "count",
           binwidth = .02)

df %>%
  ggplot() + ##because I have df%>% i don't need to attribute it to df, and therefore don't need in the ggplot
  geom_histogram(mapping = aes(x = game_time, fill = game_time)) ##do not need stat = "count" already in default setting.
                 binwidth = 10)

ggplot(data = df) +
  geom_freqpoly(mapping = aes(x = game_time, fill = "blue"), stat = "count",
                binwidth = 10)

ggplot(data = df) + ##correct code, having error with Knitr in Rmd??
  geom_histogram(mapping = aes(x = game_time), fill = "dodgerblue", colour = "black", stat = "count",
                 binwidth = 10)

ggplot(data = df) +
  geom_histogram(mapping = aes(x = try_source), fill = "dodgerblue", colour = "black", stat = "count",
                 binwidth = 10)

ggplot(data = df) +
  geom_histogram(mapping = aes(x = final_source), fill = "dodgerblue", colour = "black", stat = "count",
                 binwidth = 10)

ggplot(data = df) +
  geom_histogram(mapping = aes(x = possession_zone), fill = "dodgerblue", colour = "black", stat = "count",
                 binwidth = 10)

ggplot(data = df) +
  geom_histogram(mapping = aes(x = time_from_source), fill = "dodgerblue", colour = "black",
                 binwidth = 10)

ggplot(data = df) +
  geom_freqpoly(mapping = aes(x = game_time), stat = "count")



df %>%
  count(try_no) %>%
  mutate(prop = prop.table(n)) %>%
  ggplot() +
  geom_point(mapping = aes(x = reorder(try_no, prop), y = prop, fill = prop), stat = "identity")

  ggplot(data = df) +
  geom_point(mapping = aes(x = game_time, y = attacking_team, fill = attacking_team))
  ##want to group_by teams
  
brumbies_try_time <- df %>%
  filter(attacking_team == "Brumbies") %>%
  count(brumbies_try_time == try_no) %>%
  mutate(prop = prop.table(n)) %>%
  ggplot() +
    geom_point(mapping = aes(x = game_time, y = prop, fill = prop), stat = "identity")
  
brumbies_try_time %>%
  count(try_no) %>%
  mutate(prop = prop.table(n)) %>%
  ggplot() +
  geom_point(mapping = aes(x = game_time, y = prop, fill = prop), stat = "identity") 

brumbies_try_time <- df %>%
  filter(attacking_team == "Brumbies")
  mutate(brumbies_try_time = attacking_team == "Brumbies")
  
  brumbies_try_time %>%
    group_by(try_source) %>%
    ggplot() +
    geom_bar(mapping = aes(x = try_source, fill = try_source), colour = "black",
             stat = "count")

brumbies_try_time %>%
  view(prop)


df %>%
  ggplot(mapping = aes(x = try_no, y = attacking_team)) +
  geom_point(alpha = 0.3, size = 2)

# between teams variation- compares the differences in mean distance to goals for each attacking team

bw_teams <- df %>%
  filter(try_source == "Ruck Turnover") %>%
  group_by(attacking_team) %>%
  summarise(mean = mean(game_time))
bw_teams

wn_teams <- df %>%
  filter(try_source == "Ruck Turnover") %>%
  group_by(attacking_team) %>%
  summarise(sd = sd(game_time))
wn_teams

#how much do the teams differ by

between_sd <- sd(bw_teams$mean)
between_sd

#within team variation - how much did each team's performance differ

wn_teams <- df %>%
  filter(outcome == "Goal")%>%
  group_by(attacking_team) %>%
  summarise(sd = sd(distance_to_goal))
wn_teams

### bw_teams analysis

 bw_teams %>%
   filter(attacking_team) %>%
   group_by(attacking_team)
 ggplot() +
   geom_freqpoly(mapping = aes(x = attacking_team, y = mean), 
                 fill = attacking_team, colour = "black")
df %>%
  filter(attacking_team %in% c("Brumbies", "Rebels", "Reds", "Force", "Waratahs")) %>%
  group_by(defending_team)
  summarise(sd = sd(game_time))

  summarise(attacking_team)

print(geom_histogram)

exists("attacking_team")

str(df)
class(attacking_team)
filter(df == attacking_team)

df

print(class(attacking_team))

col_type()



###practice steps for filter and ggplot

df <- read_csv("data/2017_super-rugby_try-source-data.csv")
view(df)

str(df)

##exploratory analysis of attacking_team

n_try_source <- df%>%
  group_by(attacking_team) %>%
  summarise(game_time = n()) %>%
  arrange(desc(game_time))
n_try_source

## Conference summary AUS
Aus_average <- n_try_source %>%
  filter(attacking_team %in% c("Brumbies", "Reds", "Waratahs", "Force", "Rebels")) %>%
  group_by(game_time) %>%
  arrange(desc(game_time))
Aus_average


## Conference summary SAF

SAF_average <- n_try_source %>%
  filter(attacking_team %in% c("Kings", "Lions", "Stormers", "Cheetahs", "Bulls", "Sharks")) %>%
  group_by(game_time) %>%
  arrange(desc(game_time))
SAF_average


## Conference summary NZ

NZ_average <- n_try_source %>%
  filter(attacking_team %in% c("Blues", "Hurricanes", "Chiefs", "Highlanders", "Crusaders")) %>%
  group_by(game_time) %>%
  arrange(desc(game_time))
NZ_average


## Conference summary JP/ARG

JP_ARG_average <- n_try_source %>%
  filter(attacking_team %in% c("Sunwolves", "Jaguares")) %>%
  group_by(game_time) %>%
  arrange(desc(game_time))
JP_ARG_average

## Create summary table of points scored across super rugby

n_try_source %>%
  ggplot() +
  geom_bar(mapping = aes(x = attacking_team, y = game_time), stat = "identity")

##average time scored
Aus_average %>%
  filter(game_time) %>%
  summarise(game_time = n()) %>%
print(Aus_average)
  
average_try_time %>%
  filter(defending_team, game_time, attacking_team)
  group_by(defending_team)
  mean(mean = mean(game_time))
  arrange(desc(mean))
average_try_time

library(dplyr)
  
average2 <- average_try_time %>%
  mean(game_time) %>%
  arrange(desc(mean))
average_try_time


  filter(attacking_team %in% c("Brumbies", "Reds", "Rebels", "Waratahs", "Force"),
         c("Hurricanes", "Chiefs", "Blues", "Highlanders", "Crusaders"),
         c("Bulls", "Cheetahs", "Kings", "Stormers", "Lions", "Sharks"), 
         c("Jaguares", "Sunwolves")) %>%
  group_by(mean = mean(game_time))

average_try_time <- df %>%
  select(attacking_team, defending_team, game_time) %>%
  mutate(time_average_try = mean(game_time))

average_time_try %>%
  table(time_average_try)


average_try_time %>%
  select(attacking_team)
  arrange(desc(game_time))

average_try_time %>%
  summarise(time_average_try)
  mean(attacking_team,  = attacking_team)
         
  
  
  filter(attacking_team, defending_team, game_time)


  group_by(attackin)
mutate(mean_tries_scored = mean,game_time)
 

         
average_try_time %>%
  select(attacking_team, game_time) %>%
  group_by(mean(game_time) %in% c("Brumbies", "Reds", "Rebels", "Waratahs", "Force")) %>%
print(average_try_time)



average_try_time


  arrange(mean(game_time))
  arrange(desc(mean))
average_try_time
  

  group_by(attacking_team) %>%
  mutate(average_time_scored = mean(game_time(n)))
print(average_time_scored)
  
  
  ggplot() +
  geom_bar(mapping = aes(x = attacking_team, y = game_time), stat = "identity")



n_goals_for <- df %>%
  filter(outcome == "Goal") %>%
  group_by(attacking_team) %>%
  summarise(goals_for = n()) %>%
  arrange(desc(goals_for))
  rename(“team” = “attacking_team”)
  n_goals_for
