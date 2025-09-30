library(mosaicData)
library(ggplot2)

dataset <- mosaicData::CPS85
# "wage"、"educ"、"race"、"sex"、"hispanic"、"south"、"married"、"exper"、"union"、"age"、"sector"
# 小时工资、受教育年限、种族、性别、西班牙裔、是否居住在美国南部、
# 婚姻状况、工作经验年限、是否属于工会、年龄、行业
names(dataset)

# 去除异常点并添加颜色
dataset <- dataset[dataset$wage < 40, ]

# 颜色全局作用
ggplot(data = dataset, mapping = aes(x = exper, y = wage, color = sex)) +
  geom_point(alpha = 0.7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, size = 1) +
  scale_color_manual(values = c("indianred3", "cornflowerblue")) +
  theme_bw()

# 颜色只作用于某个元素
ggplot(data = dataset, mapping = aes(x = exper, y = wage)) +
  geom_point(aes(color = sex), alpha = 0.7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, size = 1) +
  scale_color_manual(values = c("indianred3", "cornflowerblue")) +
  theme_bw()

data(CPS85, package = "mosaicData")
dataset <- CPS85[CPS85$wage < 40, ]

# 把图形作为对象使用，这个时候Rstudio没有立即画图
myplot <- ggplot(dataset, aes(x = exper, y = wage)) +
  geom_point()

# Rstudio立即画图
myplot

# 修改点的大小并设置颜色
myplot2 <- myplot + geom_point(size = 3, color = "blue")

myplot2

# 如果没有变量，Rstudio立即画图（和普通变量的行为是一样的）
myplot + geom_smooth(method = "lm") + labs(title = "Mildly interesting graph")

# 自己验证一个东西，ggplot2工作原理确实是类似图层的概念

# 第一层，蓝色的点，size是3
myplot <- ggplot(dataset, aes(x = exper, y = wage)) +
  geom_point(size = 3, color = "blue")

# 第二层，红色的点，size是1，可以发现第二层的点是覆盖到第一层上面的
myplot2 <- myplot + geom_point(size = 1, color = "red")

myplot2

# 保存文件
ggsave("chapter4/ggplot2_layer_demo.png", plot = myplot2, width = 5, height = 4)

# 修改文件后缀即可保存为不同的格式，pdf、svg、wmf为矢量图（放大不会出现锯齿）
ggsave("chapter4/ggplot2_layer_demo.pdf", plot = myplot2, width = 5, height = 4)

# Linux上执行这个会报错，wmf是Windows元文件格式，适合在Word和PPT中使用
# Error: 'win.metafile' is not an exported object from 'namespace:grDevices'
ggsave("chapter4/ggplot2_layer_demo.wmf", width = 5, height = 4)

# 不指定plot则保存最近创建的一个图形
# 保存为svg依赖svglite这个包，需要安装一下
ggsave("chapter4/ggplot2_layer_demo.svg", width = 5, height = 4)



# 常见错误1：括号不匹配
myplot <- ggplot(dataset, aes(x = exper, y = wage) +
  geom_point(size = 3, color = "blue")

# 常见错误2：aes函数用于将变量映射到图形上，常量的赋值应该在aes函数之外
ggplot(dataset, aes(x = exper, y = wage, color = "blue")) +
  geom_point()

# 正确写法
ggplot(dataset, aes(x = exper, y = wage)) +
  geom_point(color = "blue")

# aes可以单独执行的，返回的是一个ggplot2::mapping
aes_val <- aes(x = exper123, y = wage)
