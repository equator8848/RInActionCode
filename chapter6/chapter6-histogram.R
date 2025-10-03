library(ggplot2)
library(scales)

data(mpg)

cars2008 <- mpg[mpg$year == 2008, ]

# 简单直方图
ggplot(cars2008, aes(x = cty)) +
  geom_histogram() +
  labs(title = "Default histogram")

ggplot(cars2008, aes(x = cty)) +
  geom_histogram(bins = 20, color = "white", fill = "steelblue") +
  labs(
    title = "City Miles histogram with 20 bins",
    x = "City Miles Per Gallon",
    y = "Frequency"
  )

# 带有百分比的直方图
# The dot-dot notation (`..density..`) was deprecated in ggplot2 3.4.0.
# after_stat(density) 统计变换后的概率密度
ggplot(cars2008, aes(x = hwy, y = after_stat(density))) +
  geom_histogram(bins = 20, color = "white", fill = "steelblue") +
  scale_y_continuous(labels = scales::percent) +
  labs(
    title = "Histogram with percentages",
    x = "City Miles Per Gallon",
    y = "Percent"
  )

# 带有核密度的直方图
# Using `size` aesthetic for lines was deprecated in ggplot2 3.4.0.
ggplot(cars2008, aes(x = hwy, y = after_stat(density))) +
  geom_histogram(bins = 20, color = "white", fill = "steelblue") +
  scale_y_continuous(labels = scales::percent) +
  geom_density(color = "red", linewidth = 1) +
  labs(
    title = "Histogram with percentages",
    x = "City Miles Per Gallon",
    y = "Percent"
  )
