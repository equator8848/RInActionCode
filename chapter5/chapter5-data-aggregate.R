# 数据汇总就是将观测值组替换为根据这些观测值计算的描述性统计量
# 人话版：将数据按照某些变量分组，然后聚合统计

# 32行，11列的数据框
dim(mtcars)

# 通过aggregate函数可以将数据分组然后统计，结果是8行13列的数据框
aggdata1 <- aggregate(mtcars,
  by = list(mtcars$cyl, mtcars$gear),
  FUN = mean, na.rm = TRUE
)

# 优化一波，给分组列命名然后删除多余的列，结果是8行11列的数据框
# 这里的删除列和分组是独立的，实际上分组还是使用原本的mtcars数据
aggdata2 <- aggregate(mtcars[-c(2, 10)],
  by = list(Cylinders = mtcars$cyl, Gears = mtcars$gear),
  FUN = mean, na.rm = TRUE
)

# 这样会报错：Error in aggregate.data.frame
# (dataset, by = list(Cylinders = dataset$cyl,  : arguments must have same length
dataset <- mtcars[-c(2, 10)]
aggdata3 <- aggregate(dataset,
  by = list(Cylinders = dataset$cyl, Gears = dataset$gear),
  FUN = mean, na.rm = TRUE
)

# 使用dplyr汇总数据：分组变量保留了各自的名称且在数据中不重复
aggdata3 <- mtcars %>%
  group_by(cyl, gear) %>%
  summarise_all(list(mean), na.rm = T)
