# 计算字符数量
nchar("xiami")

nchar("虾米")

mystr <- "bioxiami"

# 提取字符串，原变量不变
substr(mystr, 1, 3)

mystr

# 替换字符串，在原变量上修改
substr(mystr, 1, 3) <- "BIO"

mystr

# 连接字符串paste(..., sep="xxx")，分隔符sep默认是空格
paste("x", "y", "z")

paste("x", "y", "z", sep = "")

paste("x", c(1, 2, 3), sep = "-")

paste(c("x", "y", "z"), c(1, 2, 3), sep = "-")

paste(c("x", "y", "z", "abc"), c(1, 2, 3), sep = "-")

# 当传入 paste() 函数的向量长度不一致时，R会自动对较短的向量进行循环补齐，使其长度与最长的向量一致
paste("xiami", c("x", "y", "z", "abc"), c(1, 2, 3), sep = "-")
