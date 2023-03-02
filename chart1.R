## Chart 1

# Load libraries
library("dplyr")
library("stringr")
library("ggplot2")

# Load data
checkouts <- read_csv("C:/Users/infin/INFO201/2017-2023-10-Checkouts-SPL-Data.csv")

# Organize data into sum for all years
sum_digital <- checkouts %>% 
  group_by(CheckoutYear) %>%
  filter(UsageClass == "Digital") %>%
  summarize(digital_Checkouts = sum(Checkouts))


sum_physical <- checkouts %>% 
  group_by(CheckoutYear) %>%
  filter(UsageClass == "Physical") %>%
  summarize(physical_Checkouts = sum(Checkouts)) 

# Join both datasets and make a ratio between digital and phsyical
digital_physical <- inner_join(sum_digital, sum_physical, by = NULL) %>%
  mutate(digital_to_physical_ratio = digital_Checkouts / physical_Checkouts)

# Create bar chart
bar_chart <- ggplot(data = digital_physical, aes(x = CheckoutYear, y = digital_to_physical_ratio)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(title = "Digital to Physical Checkout Ratios by Year", x = "Year", y = "Digital to Physical Checkout Ratio") 

bar_chart