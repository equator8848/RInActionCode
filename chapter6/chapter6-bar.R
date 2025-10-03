# 条形图通过水平或者水平的条形展示了分类变量的分布（频数）

# 风湿性关节炎新疗法研究
install.packages("vcd")

data(Arthritis, package = "vcd")
# Marked 明显改善、Some 部分改善、None没有改善
table(Arthritis$Improved)

# 研究病人的改善情况
library(ggplot2)
library(dplyr)

# 简单条形图
ggplot(Arthritis, aes(x = Improved)) +
  geom_bar() +
  labs(
    title = "Simple Bar chart",
    x = "Improvement",
    y = "Frequency"
  )

# 水平条形图
ggplot(Arthritis, aes(x = Improved)) +
  geom_bar() +
  labs(
    title = "Horizontal Bar chart",
    x = "Improvement",
    y = "Frequency"
  ) +
  coord_flip()

# 研究使用安慰剂是否会对病情改善有影响
table(Arthritis$Improved, Arthritis$Treatment)

# 堆叠条形图
ggplot(Arthritis, aes(x = Treatment, fill = Improved)) +
  geom_bar(position = "stack") +
  labs(
    title = "Stack Bar chart",
    x = "Treatment",
    y = "Frequency"
  )

# 分组条形图
ggplot(Arthritis, aes(x = Treatment, fill = Improved)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Grouped Bar chart",
    x = "Treatment",
    y = "Frequency"
  )

# 填充条形图（调整比例后的堆积条形图，每个条的高度为1，段的高度表示百分比）
# 比较一个分类变量的各水平在另一个分类变量各水平的占比时非常有用
ggplot(Arthritis, aes(x = Treatment, fill = Improved)) +
  geom_bar(position = "fill") +
  labs(
    title = "Filled Bar chart",
    x = "Treatment",
    y = "Proportion"
  )

# 使用自带数据集演示，创建非基于计数数据或频数数据的条形图

# 加载必要的包，这里代码未显式加载，实际运行需要加载dplyr和ggplot2
# library(dplyr)
# library(ggplot2)

# 创建一个数据框'states'
# state.region 是R内置的向量，表示美国各州所属的地区
# state.x77 是R内置的矩阵，包含美国各州的一些统计数据
# 将state.region和state.x77合并成一个数据框
states <- data.frame(state.region, state.x77)

# 对数据进行处理，计算每个地区的平均文盲率
# 使用dplyr包的管道操作符 %>%
# group_by(state.region) 按照州所属的地区进行分组
# summarize(mean = mean(Illiteracy)) 对每个分组计算文盲率（Illiteracy）的平均值，并将结果命名为'mean'
plotdata <- states %>%
  group_by(state.region) %>%
  summarize(mean = mean(Illiteracy))

# 使用ggplot2包创建柱状图
# ggplot(plotdata, aes(x = reorder(state.region, mean), y = mean)) 指定绘图的数据为plotdata
# aes() 函数用于指定图形的美学映射，x轴按照平均文盲率对地区进行重排序，y轴为平均文盲率
# geom_bar(stat = "identity") 绘制柱状图，stat = "identity" 表示使用数据中的值作为柱子的高度，而非默认的计数值
# labs(x = "Region", y = "", title = "Mean Illiteracy Rate") 设置图形的标签，x轴标签为'Region'，y轴标签为空，标题为'Mean Illiteracy Rate'
ggplot(plotdata, aes(x = reorder(state.region, mean), y = mean)) +
  geom_bar(stat = "identity") +
  labs(x = "Region", y = "", title = "Mean Illiteracy Rate")

# 对数据进行分组和汇总操作
# states是一个数据框，存储了相关数据
# group_by(state.region) 按照state.region列对数据进行分组
# 这样后续的汇总操作会针对每个不同的state.region组分别进行
plotdata <- states %>%
  group_by(state.region) %>%
  # summarize函数用于对每个分组进行汇总计算
  summarize(
    # n = n() 计算每个分组中的观测数量
    n = n(),
    # mean = mean(Illiteracy) 计算每个分组中Illiteracy列的平均值
    mean = mean(Illiteracy),
    # se = sd(Illiteracy) / sqrt(n) 计算每个分组中Illiteracy列的标准误差
    # sd(Illiteracy) 计算Illiteracy列的标准差
    # sqrt(n) 计算分组观测数量的平方根
    se = sd(Illiteracy) / sqrt(n)
  )

# 使用ggplot2库创建绘图对象
# plotdata是之前汇总得到的数据框
# aes(x = reorder(state.region, mean), y = mean) 设置绘图的美学映射
# reorder(state.region, mean) 按照mean列的值对state.region列进行重新排序
# 这样在绘图时州的区域会按照平均文盲率进行排序
ggplot(plotdata, aes(x = reorder(state.region, mean), y = mean)) +
  # geom_bar(stat = "identity", fill = "skyblue") 添加条形图图层
  # stat = "identity" 表示使用数据框中的实际值作为条形的高度
  # fill = "skyblue" 设置条形图的填充颜色为天蓝色
  geom_bar(stat = "identity", fill = "skyblue") +
  # geom_errorbar(aes(ymin = mean - se, ymax = mean + se), width = 0.2) 添加误差线图层
  # aes(ymin = mean - se, ymax = mean + se) 设置误差线的上下限
  # 下限为平均值减去标准误差，上限为平均值加上标准误差
  # width = 0.2 设置误差线的宽度为0.2
  geom_errorbar(aes(ymin = mean - se, ymax = mean + se), width = 0.2) +
  # labs函数用于设置图形的标签
  # x = "Region" 设置x轴的标签为"Region"
  # y = "" 设置y轴的标签为空
  # title = "Mean Illiteracy Rate" 设置图形的标题为"Mean Illiteracy Rate"
  # subtitle = "with standard error bars" 设置图形的副标题为"with standard error bars"
  labs(x = "Region", y = "", title = "Mean Illiteracy Rate",
       subtitle = "with standard error bars")

data(Arthritis, package = "vcd")

# 调整条形图的颜色
# 使用fill指定具有区域的几何对象颜色（条形、扇形、方格）
# 使用color指定没有区域的几何对象（点、线、边框）
ggplot(Arthritis, aes(x = Improved)) +
  geom_bar(fill = "gold", color = "black") +
  labs(
    title = "TReatment Outcome",
  )

# 将颜色映射到分类变量的层级
ggplot(Arthritis, aes(x = Treatment, fill = Improved)) +
  geom_bar(position = "stack", color = "black") +
  scale_fill_manual(values = c("red", "grey", "gold")) +
  labs(
    title = "Stack Bar with custom color",
    x = "Treatment",
    y = "Frequency"
  )

# 条形图的标签:当数据很多时，条形图的建议画法是水平条形图或者倾斜标签
ggplot(mpg, aes(x = model)) +
  geom_bar() +
  labs(
    title = "Car models in the mpg dataset",
    y = "Frequency"
  )

# 水平
ggplot(mpg, aes(x = model)) +
  geom_bar() +
  labs(
    title = "Car models in the mpg dataset",
    y = "Frequency"
  ) +
  coord_flip()

# 倾斜标签
ggplot(mpg, aes(x = model)) +
  geom_bar() +
  labs(
    title = "Car models in the mpg dataset",
    y = "Frequency"
  ) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1, size = 8))
