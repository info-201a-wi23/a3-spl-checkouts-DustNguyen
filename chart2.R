## Chart 2

# Load libraries
library("dplyr")
library("stringr")
library("ggplot2")

# Load data
checkouts <- read_csv("C:/Users/infin/INFO201/2017-2023-10-Checkouts-SPL-Data.csv")

checkouts <- checkouts %>% 
  mutate(checkout_date = as.Date(paste0(CheckoutYear, "/", CheckoutMonth, "/", "01"), format = "%Y/%m/%d"))

ggplot(checkouts, aes(x=checkout_date, y=Checkouts, color = UsageClass)) +
  geom_point() +
  labs(title = "Number of Item Checkouts By Date", x = "Reported Date", y = "Number of Checkouts", color = "Item Type")

