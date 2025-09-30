grade <- data.frame(
  Name = c("Joey", "Tom", "Jetty", "Lopy", "RainSis"),
  Gender = c("Male", "Male", "Female", "Female", "Male"),
  Age = c(18, 19, 17, 18, 19),
  Chinese = c(85, 90, 78, 88, 92),
  Math = c(92, 87, 80, 95, NA),
  English = c(88, 91, 82, 93, 90),
  Politics = c(80, 85, 65, 86, 88),
  History = c(83, 89, 77, 87, 91),
  Geography = c(86, 92, 81, 94, 93)
)

grade

# NA（Not Available）表示数据缺失值
# is.na函数可以检测是否存在缺失值，其返回一个同样大小的布尔类型对象，缺失值的对应元素会被置为TRUE。
is.na(grade[, 4:9])

# NA不能用来比较
a_number <- 666

print(a_number == NA)

print(NA == NA)

# na.omit移除数据对象中包含缺失值（NA）的行（适合包含缺失值不多的数据）
new_grade <- na.omit(grade)

# NaN（Not A Number）表示不可能的值
a_nan <- NaN

print(a_nan == NaN)

print(is.nan(a_nan))

# Inf -Inf 表示正无穷和负无穷
a_inf <- Inf

print(a_inf == Inf)

print(is.infinite(a_inf))





# 类型转换：is.datatype()函数判断某个对象是否是某个类型，as.datatype()函数将对象转换为对应的类型
# 每个类型都有相关的方法，datatype的取值有：numeric、character、vector、matrix、data.frame、factor、logical
a_number <- 666
is.numeric(a_number)

obj <- c(11, 12, 13)

# 这里判断numeric返回TRUE，一开始有点搞不明白。这样的话，程序上判断类型，a_number不是和obj同一个类型的了吗
is.numeric(obj)

is.vector(obj)

# 问了AI，a_number 和 obj 本质上都是向量，只不过 a_number 是长度为1的数值向量，而 obj 是长度为3的数值向量。
is.vector(a_number)
















