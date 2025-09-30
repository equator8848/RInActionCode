install.packages(c("mosaicData", "ggplot2", "scales"))

library(mosaicData)
library(ggplot2)

dataset <- mosaicData::CPS85
# "wage"、"educ"、"race"、"sex"、"hispanic"、"south"、"married"、"exper"、"union"、"age"、"sector"
# 小时工资、受教育年限、种族、性别、西班牙裔、是否居住在美国南部、
# 婚姻状况、工作经验年限、是否属于工会、年龄、行业
names(dataset)

# ggplot需要输入一个数据框和一组映射，映射是数据框变量到图形的可视属性的映射
ggplot(data = dataset, mapping = aes(x = exper, y = wage))

# geom_xxx函数在图形上放置几何对象，geom_xxx函数家族非常丰富
ggplot(data = dataset, mapping = aes(x = exper, y = wage)) +
  geom_point()

# 去除异常点并添加颜色
dataset <- dataset[dataset$wage < 40, ]

ggplot(data = dataset, mapping = aes(x = exper, y = wage)) +
  geom_point(color = "cornflowerblue", alpha = 0.7, size = 1.5) +
  theme_bw()

# geom_smooth函数在图形上添加平滑曲线，以此来展示数据的趋势
ggplot(data = dataset, mapping = aes(x = exper, y = wage)) +
  geom_point(color = "cornflowerblue", alpha = 0.7, size = 1.5) +
  geom_smooth(method = "lm") +
  theme_bw()

# 将变量映射到点的颜色、形状和线的颜色，注意这时geom_point不要设置color参数了
# （这可以让多组观测值在单个图形中叠加，这个过程被称为分组）
ggplot(
  data = dataset,
  mapping = aes(
    x = exper, y = wage, color = sex, shape = sex, linetype = sex
  )
) +
  geom_point(alpha = 0.7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, size = 1.5) +
  theme_bw()

# 修改标尺设置
ggplot(
  data = dataset,
  mapping = aes(
    x = exper, y = wage, color = sex, shape = sex,
    linetype = sex
  )
) +
  geom_point(alpha = 0.7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, size = 1.5) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5)) +
  scale_color_manual(values = c("indianred3", "cornflowerblue")) +
  theme_bw()

# 设置标签（使用scales格式化标签）
ggplot(
  data = dataset,
  mapping = aes(x = exper, y = wage, color = sex, shape = sex, linetype = sex)
) +
  geom_point(alpha = 0.7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, size = 1.5) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5), labels = scales::dollar) +
  scale_color_manual(values = c("indianred3", "cornflowerblue")) +
  theme_bw()

# 刻面图：为给定的某个变量（组合）的每一个水平分别绘制一张图
ggplot(
  data = dataset,
  mapping = aes(x = exper, y = wage, color = sex, shape = sex, linetype = sex)
) +
  geom_point(alpha = 0.7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, size = 1.5) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5), labels = scales::dollar) +
  scale_color_manual(values = c("indianred3", "cornflowerblue")) +
  facet_wrap(~sector) +
  theme_bw()

# 设置标签（标题、副标题、说明文字）
ggplot(
  data = dataset,
  mapping = aes(x = exper, y = wage, color = sex, shape = sex, linetype = sex)
) +
  geom_point(alpha = 0.7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, size = 1.5) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5), labels = scales::dollar) +
  scale_color_manual(values = c("indianred3", "cornflowerblue")) +
  facet_wrap(~sector) +
  labs(
    title = "薪资与工作年限的关系", subtitle = "mosaicData::CPS85数据集",
    x = "工作年限", y = "薪资"
  ) +
  theme_bw()

# 设置主题，主题函数以theme_开头
ggplot(
  data = dataset,
  mapping = aes(x = exper, y = wage, color = sex, shape = sex, linetype = sex)
) +
  geom_point(alpha = 0.7, size = 1.5) +
  geom_smooth(method = "lm", se = FALSE, size = 1.5) +
  scale_x_continuous(breaks = seq(0, 60, 10)) +
  scale_y_continuous(breaks = seq(0, 30, 5), labels = scales::dollar) +
  scale_color_manual(values = c("indianred3", "cornflowerblue")) +
  facet_wrap(~sector) +
  labs(
    title = "薪资与工作年限的关系", subtitle = "mosaicData::CPS85数据集",
    x = "工作年限", y = "薪资"
  ) +
  theme_light()
