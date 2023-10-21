# Load the tidyverse library
library(tidyverse)

# Load the csv file using read_csv() and assign it to a dataframe
titanic <- read_csv("titanic.csv")

# Familiarize yourself with the data using glimpse()
glimpse(titanic)

# Check for missing values using either view() or isnull()
view(titanic)

# Check for the datatypes and convert datatypes if required
titanic$survived    <- as.factor(titanic$survived)
titanic$pclass      <- as.factor(titanic$pclass)
titanic$sex         <- as.factor(titanic$sex)
titanic$who         <- as.factor(titanic$who)
titanic$embark_town <- as.factor(titanic$embark_town)
titanic$sibsp       <- as.factor(titanic$sibsp)
titanic$parch       <- as.factor(titanic$parch)
titanic$embarked    <- as.factor(titanic$embarked)
titanic$class       <- as.factor(titanic$class)
titanic$deck        <- as.factor(titanic$deck)
titanic$alive       <- as.factor(titanic$alive)

# Count passengers by deck - has 688 NA values
titanic %>% 
  count(deck, sort = TRUE)

# Count passengers by age - has 177 NA values
titanic %>% 
  count(age, sort = TRUE) %>% 
  head()

# Eliminating deck and age, check for incomplete cases
# There are only two rows, with NA in embarked and embark_town
titanic %>% 
  select (-deck, -age) %>% 
  filter(!complete.cases(.)) %>% 
  view

# Save copy of dataframe before modifying
titanic_backup <- titanic

# Filter out 2 rows with null in embark_town using drop_na
titanic <- titanic %>% 
  drop_na(embark_town)

# Remove deck attribute from dataframe
titanic <- titanic %>% 
  select (-deck) 

# Calculate mean age
mean_age <- mean(titanic$age, na.rm = TRUE)

# Replace ages with NA by mean age using replace_na
titanic <- titanic %>% 
  replace_na(list(age = mean_age))

# Check that no incomplete cases remain
titanic %>% 
  filter(!complete.cases(.)) %>% 
  view

# Bar chart of survivors by man / woman / child category
titanic %>% 
  ggplot(aes(who, fill=survived)) +
  geom_bar(alpha = 0.5) +
  labs(title="Survivors by Man / Woman / Child category",
       x = "Man / Woman / Child Categories",
       y = "Count of people")

# Histogram by age of all passengers - shows distortion with NA replaced by mean
titanic %>% 
  ggplot(mapping=aes(x=age)) +
  geom_histogram() +
  labs(title="Age of All Passengers",
       x = "Age",
       y = "Count of people")

# Histogram by age of all passengers using backup so no distortion with mean
titanic_backup %>% 
  ggplot(mapping=aes(x=age)) +
  geom_histogram() +
  labs(title="Age of All Passengers",
       x = "Age",
       y = "Count of people")

# Scatterplot of fares by age - use backup to avoid mean age distortion
titanic_backup %>% 
  # filter(fare<300) %>% 
  ggplot(aes(x=age, y=fare)) +
  geom_point() +
  labs(title="Fares by Age scatterplot",
       x = "Passenger Age",
       y = "Fare Paid")

# Boxplot of fares by class
titanic %>% 
  ggplot(aes(x=class, y=fare)) +
  geom_boxplot() +
  labs(title="Fares by class boxplot",
       x = "Passenger Class",
       y = "Fare Paid")

# Boxplot of fares by class - excluding top outlier
titanic %>% 
  filter(fare<300) %>% 
  ggplot(aes(x=class, y=fare)) +
  geom_boxplot() +
  labs(title="Fares by class boxplot",
       x = "Passenger Class",
       y = "Fare Paid")

# Bar chart of survivors by embark_town
titanic %>% 
  drop_na(embark_town) %>%
  ggplot(aes(embark_town, fill=survived)) +
  geom_bar(alpha = 0.5) +
  # facet_wrap(~gender) +
  labs(title="Survivors by Embarkation Town",
       x = "Embarkation Town",
       y = "Count of people")

# Bar chart of non-survivors by class
titanic %>% 
  filter(survived == 0) %>% 
  ggplot(aes(class, fill=survived)) +
  geom_bar(alpha = 0.5) +
  # facet_wrap(~gender) +
  labs(title="Non-Survivors by Class",
       x = "Class",
       y = "Count of people")

# Histogram of adult male survivor by age - use backup to avoid mean age distortion
titanic_backup %>% 
  filter(survived == 1, adult_male == TRUE) %>% 
  ggplot(mapping=aes(x=age)) +
  geom_histogram() +
  labs(title="Age of Adult Male Survivors",
       x = "Age",
       y = "Count of people")