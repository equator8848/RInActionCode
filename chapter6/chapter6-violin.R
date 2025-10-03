library(ggplot2)

cars <- mpg[mpg$cyl != 5, ]
cars$Cylinders <- factor(cars$cyl)

# 小提琴图是核密度图以镜像的方式在箱线图上的叠加
ggplot(cars, aes(x = Cylinders, y = cty)) +
  geom_boxplot(width = 0.2, fill = "green") +
  geom_violin(fill = "gold", alpha = 0.3) +
  labs(
    x = "Number of Cylinders",
    y = "Miles Per Gallon",
    title = "Violin Plots of Miles Per Gallon"
  )
