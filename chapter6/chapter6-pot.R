library(ggplot2)
library(dplyr)

plotdata <- mpg %>%
  filter(year == "2008") %>%
  group_by(model) %>%
  summarise(meanHwy = mean(hwy))

plotdata

ggplot(plotdata, aes(x = meanHwy, y = model)) +
  geom_point() +
  labs(
    x = "Miles Per Gallon",
    y = "", title = "Gas Mileage for Car Models"
  )

# 卡罗拉这么牛逼？
ggplot(plotdata, aes(x = meanHwy, y = reorder(model, meanHwy))) +
  geom_point() +
  labs(
    x = "Miles Per Gallon",
    y = "", title = "Gas Mileage for Car Models"
  )
