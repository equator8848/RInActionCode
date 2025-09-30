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

# 假设未成年不能参加考试，如果年龄小于18岁，将数据视为异常值（修改现有变量）
grade$Age[grade$Age < 18] <- NA

# 创建新变量之transform函数
grade <- transform(grade,
  total_score = Chinese + Math + English + Politics + History + Geography,
  mean_score = (Chinese + Math + English + Politics + History + Geography) / 6
)

# 结合平均分评价（新增变量），within和我们之前讲的with领域展开类似，不过其允许我们修改数据框
grade <- within(grade, {
  evaluation <- NA
  evaluation[mean_score >= 90] <- "优"
  evaluation[mean_score >= 80 & mean_score < 90] <- "良"
  evaluation[mean_score < 80] <- "继续努力"
})

# 变量重编码的语法 variable[condition] <- expression

# 可以通过names函数来修改变量名
names(grade)

names(grade)[12] <- "Evaluation"

grade
