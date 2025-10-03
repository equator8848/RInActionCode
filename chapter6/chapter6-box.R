library(ggplot2)
# 箱线图又称为盒须图，是可视化分布与组间差异的有效方法
ggplot(mtcars, aes(x = "", y = mpg)) +
  geom_boxplot() +
  labs(y = "Miles Per Gallon", x = "", title = "Box Plot")

boxplot.stats(mtcars$mpg)

cars <- mpg[mpg$cyl != 5, ]
cars$Cylinders <- factor(cars$cyl)
cars$Year <- factor(cars$year)

# 使用并列箱线图进行跨组比较
ggplot(cars, aes(x = Cylinders, y = cty)) +
  geom_boxplot() +
  labs(
    x = "Number of Cylinders",
    y = "Miles Per Gallon",
    title = "Car Mileage Data"
  )

# 增加凹槽
ggplot(cars, aes(x = Cylinders, y = cty)) +
  geom_boxplot(notch = T, fill = "steelblue", varwidth = T) +
  labs(
    x = "Number of Cylinders",
    y = "Miles Per Gallon",
    title = "Car Mileage Data"
  )

# 多个分组因子绘制箱线图
ggplot(cars, aes(x = Cylinders, y = cty, fill = Year)) +
  geom_boxplot() +
  labs(
    x = "Number of Cylinders",
    y = "Miles Per Gallon",
    title = "City Mileage by # Cylinders and Year"
  ) +
  scale_fill_manual(values = c("gold", "green"))
