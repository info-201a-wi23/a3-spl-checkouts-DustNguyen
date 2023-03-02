## Chart 1

# Load libraries
library("dplyr")
library("stringr")
library("ggplot2")

# Load data
checkouts <- read_csv("C:/Users/infin/INFO201/2017-2023-10-Checkouts-SPL-Data.csv")

# Organize dataset to show checkouts grouped by material type.
# Arrange the dataset by the number of checkouts in descending order.
checkout_category <- checkouts %>% 
  group_by(MaterialType) %>%
  summarize(Checkouts = sum(Checkouts)) %>%
  arrange(-Checkouts)

# Organize dataset to show the first five rows
checkout_category <- checkout_category[1:5,]

ggplot(checkout_category, aes(x="", y=Checkouts, fill=MaterialType)) +
  geom_bar(stat="identity", width=1, color="aliceblue") +
  labs(title = "Material Type Distribution") +
  scale_fill_discrete(name = "Material Type") +
  coord_polar("y", start=0) +
  theme_void()