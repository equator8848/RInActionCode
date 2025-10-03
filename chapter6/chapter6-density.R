library(ggplot2)

data(mpg)

cars2008 <- mpg[mpg$year == 2008, ]

ggplot(cars2008, aes(x = cty)) +
  geom_density() +
  labs(title = "Default kernel density")

# 填充区域为红色
ggplot(cars2008, aes(x = cty)) +
  geom_density(fill = "red") +
  labs(
    title = "Filled kernel density",
    x = "City Miles Per Gallon"
  )

# 默认带宽，带宽越小，细节越多
bw.nrd0(cars2008$cty)

ggplot(cars2008, aes(x = cty)) +
  geom_density(fill = "red", bw = 0.5) +
  labs(
    title = "Filled kernel density with bw=0.5",
    x = "City Miles Per Gallon"
  )

ggplot(cars2008, aes(x = cty)) +
  geom_density(fill = "red", bw = 3) +
  labs(
    title = "Filled kernel density with bw=3",
    x = "City Miles Per Gallon"
  )

# 核密度图的比较
data(mpg)
cars2008 <- mpg[mpg$year == 2008 & mpg$cyl != 5, ]
cars2008$Cylinders <- factor(cars2008$cyl)

# 绘制核密度曲线
ggplot(cars2008, aes(x = cty, color = Cylinders, linetype = Cylinders)) +
  geom_density(size = 1) +
  labs(title = "Fuel Efficiecy by Number of Cylinders", x = "City Miles Per Gallon")

# 绘制填充核密度曲线
ggplot(cars2008, aes(x = cty, fill = Cylinders)) +
  geom_density(alpha = 0.4) +
  labs(title = "Fuel Efficiecy by Number of Cylinders", x = "City Miles Per Gallon")
