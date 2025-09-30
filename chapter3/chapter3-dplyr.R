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

install.packages("dplyr")

library(dplyr)

# 创建汇总变量（mutate：变化，产生突变）
grade <- mutate(grade,
  total_score = Chinese + Math + English + Politics + History + Geography,
  mean_score = (Chinese + Math + English + Politics + History + Geography) / 6
)

# 重编码：把性别中的Male换成M，Female换成F
grade$Gender <- recode(grade$Gender, "Male" = "M", "Female" = "F")

# 重命名变量：把total_score重命名为TotalScore
grade <- rename(grade, TotalScore = "total_score")

# 排序（desc倒序排序）
grade <- arrange(grade, desc(TotalScore))

# 选择满足某组条件的观测值（行）
grade <- filter(grade, !is.na(Math))

# 选择或剔除变量（列）
grade <- select(grade, Name, TotalScore)





