# 四种不同的图形创建方法：base、lattice、grid默认安装，无需单独安装；
# ggplot2需要单独安装，是当前R中最强大最流行的图形创建方法

# Base：过程式，一步一步命令绘图（直观，灵活，但不易复用）。

# Lattice：公式接口（y ~ x），一条语句即可完成，适合分面图，但自定义麻烦。

# Grid：低层级系统，提供绘图原语（需要手动搭建坐标系，灵活但繁琐）。

# ggplot2：基于 Grammar of Graphics，语法层次化，可叠加图层，最适合复杂可视化。

# Base R
plot(mtcars$wt, mtcars$mpg,
     main = "Base Graphics",
     xlab = "Weight",
     ylab = "Miles per Gallon",
     pch = 19, col = "skyblue")


# lattice
# 它的图形是一次性创建的，所有的面板和元素在一个函数调用中定义。图形美观且具有良好的对称性。
# 适用场景：当需要展示数据的多个子集之间的关系时非常有用，例如按不同分组变量展示数据分布。

# Lattice
library(lattice)
xyplot(mpg ~ wt, data = mtcars,
       main = "Lattice",
       xlab = "Weight", ylab = "Miles per Gallon",
       pch = 19, col = "skyblue")

# Grid
library(grid)
grid.newpage()
pushViewport(plotViewport(margins = c(5, 4, 4, 2)))
pushViewport(dataViewport(mtcars$wt, mtcars$mpg))

grid.xaxis()
grid.yaxis()
grid.rect()
grid.points(mtcars$wt, mtcars$mpg, pch = 19, gp = gpar(col = "skyblue"))

grid.text("Weight", y = unit(-3, "lines"))
grid.text("Miles per Gallon", x = unit(-3, "lines"), rot = 90)
grid.text("Grid Graphics", y = unit(1, "npc") - unit(1, "lines"))

# 加载ggplot2包
# ggplot2
library(ggplot2)
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "skyblue") +
  labs(title = "ggplot2",
       x = "Weight", y = "Miles per Gallon")
