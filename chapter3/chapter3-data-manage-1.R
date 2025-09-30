# 给出定义一个数据框的R语言代码，其每列分别是姓名，性别，年龄，语数英政史地六门课程的分数，一共5行数据，使用英文变量名

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

# 变量的重编码是根据同一个变量或其它变量现有值创建新值的过程

# 假设未成年不能参加考试，如果年龄小于18岁，将数据视为异常值
grade$Age[grade$Age < 18] <- NA



# 创建新变量之直接创建
grade$total_score1 <- grade$Chinese + grade$Math + grade$English + grade$Politics + grade$History + grade$Geography

grade$mean_score1 <- (grade$Chinese + grade$Math + grade$English + grade$Politics + grade$History + grade$Geography) / 6

# 创建新变量之transform函数
grade <- transform(grade,
  total_score2 = Chinese + Math + English + Politics + History + Geography,
  mean_score2 = (Chinese + Math + English + Politics + History + Geography) / 6
)

View(grade[c("total_score1", "mean_score1", "total_score2", "mean_score2")])
