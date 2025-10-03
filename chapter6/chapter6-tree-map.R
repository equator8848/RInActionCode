library(ggplot2)
library(dplyr)
# install.packages("treemapify")
library(treemapify)

# 对生产厂家进行统计
plotdata1 <- mpg %>% count(manufacturer)

# 绘制树形图，fill是分类变量、area是每个水平的数量、label是选项变量
ggplot(plotdata1, aes(fill = manufacturer, area = n, label = manufacturer)) +
  geom_treemap() +
  geom_treemap_text() +
  theme(legend.position = "none")

plotdata2 <- mpg %>% count(manufacturer, drv)

# 将plotdata2的drv变量转换为因子，4-wheel、front-wheel、rear

plotdata2$drv <- factor(plotdata2$drv,
  levels = c("4", "f", "r"),
  labels = c("4-wheel", "front-wheel", "rear")
)

# subgroup用于创建分组
ggplot(plotdata2, aes(fill = manufacturer, area = n, label = manufacturer, subgroup = drv)) +
  geom_treemap() +
  geom_treemap_subgroup_border() +
  geom_treemap_subgroup_text(
    place = "middle",
    colour = "black",
    alpha = 0.5,
    grow = FALSE
  ) +
  geom_treemap_text(colour = "white", place = "centre", grow = FALSE) +
  theme(legend.position = "none")
