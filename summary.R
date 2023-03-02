# Load relevant packages
library("tidyverse")
library(dplyr)
library(ggplot2)
library("scales")

# Read in csv file

checkouts <- read_csv("C:/Users/infin/INFO201/2017-2023-10-Checkouts-SPL-Data.csv")

# Question 1
# What is the sum of physical and digital checkouts?
sum_digital <- checkouts %>% 
  filter(UsageClass == "Digital") %>%
  summarize(digital_Checkouts = sum(Checkouts)) %>%
  pull(digital_Checkouts)
 

sum_physical <- checkouts %>% 
  filter(UsageClass == "Physical") %>%
  summarize(physical_Checkouts = sum(Checkouts)) %>%
  pull(physical_Checkouts)

sum_digital
sum_physical

# Question 2
# What are the average digital and physical checkouts per item?
avg_digital <- checkouts %>% 
  filter(UsageClass == "Digital") %>%
  summarize(Checkouts = mean(Checkouts)) %>%
  pull(Checkouts)

avg_physical <- checkouts %>% 
  filter(UsageClass == "Physical") %>%
  summarize(Checkouts = mean(Checkouts)) %>%
  pull(Checkouts)

avg_digital
avg_physical

# Question 3
# Which year had the most checkout for digital and physical items?
max_digital <- checkouts %>%
  group_by(CheckoutYear) %>%
  filter(UsageClass == "Digital") %>%
  summarize(Checkouts = sum(Checkouts)) %>%
  filter(Checkouts == max(Checkouts)) %>%
  pull(CheckoutYear)

max_physical <- checkouts %>%
  group_by(CheckoutYear) %>%
  filter(UsageClass == "Physical") %>%
  summarize(Checkouts = sum(Checkouts)) %>%
  filter(Checkouts == max(Checkouts)) %>%
  pull(CheckoutYear)

max_digital
max_physical

# Question 4
# Which year had the highest ratio of digital to physical checkouts?

table_digital <- checkouts %>% 
  group_by(CheckoutYear) %>%
  filter(UsageClass == "Digital") %>%
  summarize(digital_Checkouts = sum(Checkouts))


table_physical <- checkouts %>% 
  group_by(CheckoutYear) %>%
  filter(UsageClass == "Physical") %>%
  summarize(physical_Checkouts = sum(Checkouts)) 
  

digital_physical <- inner_join(table_digital, table_physical, by = NULL) %>%
  mutate(digital_to_physical_ratio = digital_Checkouts / physical_Checkouts) %>%
  filter(digital_to_physical_ratio == max(digital_to_physical_ratio)) %>%
  pull(CheckoutYear)

digital_physical

# Question 5
# What is the total checkouts for every material type?
checkout_category <- checkouts %>% 
  group_by(MaterialType) %>%
  summarize(Checkouts = sum(Checkouts))