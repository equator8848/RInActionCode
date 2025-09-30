id <- c(1, 2, 3)
fragment <- c("我", "才是", "奶龙")

funny_data_frame <- data.frame(id, fragment)

say <- "我是奶龙"

with(funny_data_frame, {
  say <- paste0(fragment, collapse = "")
  say
})

say
