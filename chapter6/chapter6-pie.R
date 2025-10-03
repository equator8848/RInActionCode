# 饼图在R语言中不吃香，因为人们觉得饼图不如条形图或者点图

install.packages("remotes")

remotes::install_github("rkabacoff/ggpie")

library(ggpie)

ggpie(mpg, class)

ggpie(mpg, class, legend = FALSE, offset = 1.3,
      title = "Automobiles by Car Class")

ggpie(mpg, class, year, legend = FALSE, offset = 1.3,
      title = "Car Class by Year")