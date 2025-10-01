# 自定义函数
ai_core <- function(input_text) {
  output <- sub("吗", "", input_text)
  output <- sub("？", "！", output)
  return(output)
}

ai_core("听得懂中文吗？")

ai_core("真的吗")

