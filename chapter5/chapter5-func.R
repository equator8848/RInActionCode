# 自定义函数

# 结构：
# 函数名 <- function(参数1,参数2,...){
# statements
# return(object)
#}

# 自定义一个函数，对输入进行处理后返回一个处理结果
ai_core <- function(input_text) {
  output <- sub("吗", "", input_text)
  output <- sub("？", "！", output)
  return(output)
}

ai_core("听得懂中文吗？")

ai_core("真的吗")

