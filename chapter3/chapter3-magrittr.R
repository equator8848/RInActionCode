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

# 使用magrittr包进行管道操作（安装dplyr的时候一起安装了）

library(magrittr)

grade <-
  mutate(grade,
    total_score = Chinese + Math + English + Politics + History + Geography,
    mean_score = (Chinese + Math + English + Politics + History + Geography) / 6
  ) %>%
  rename(TotalScore = "total_score") %>%
  filter(!is.na(Math)) %>%
  select(Name, TotalScore) %>%
  arrange(desc(TotalScore))
