# 矩阵或者数据框的转置（反转行列）
cars <- mtcars[1:5, 1:4]
cars
t(cars)

# 宽表：每一行代表唯一的观测值，大部分R函数使用宽表格式的数据框
# 长表：每一行代表唯一的测量值。
# tidyr 这个包可以进行宽表转长表转换

data_wide <- data.frame(
  ID = c("FR", "BE", "GER"),
  Country = c("France", "Belgium", "Germany"),
  LExp1990 = c(77.0, 76.1, 75.3),
  LExp2000 = c(79.2, 77.8, 78.2),
  LExp2010 = c(81.8, 80.3, 80.5)
)

data_wide

data_long <- tidyr::gather(data_wide,key = "LifeExpectancyYearVal",value = "Life_Exp",
              c("LExp1990","LExp2000","LExp2010"))
data_long
