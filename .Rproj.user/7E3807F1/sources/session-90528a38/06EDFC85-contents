# R函数的特点之一就说可以应用到一系列的数据对象上
# 包括标量、向量、矩阵、数组和数据框
mymatrix <- matrix(runif(12), nrow = 3)

# log函数是个向量化函数，这里的结果也是个矩阵
log(mymatrix)

# 向量化函数的特点是它会对输入对象的每个元素独立地执行操作
# mean不是向量化函数，所以其结果是个标量（大部分聚合函数都不是向量化函数）
mean(mymatrix)

# apply函数可以将任意函数应用到矩阵、数组、数据框的任何维度上
# 参数格式：apply(x, MARGIN, FUN)
# MARGIN指定是维度，1 表示按行应用函数，2表示按列应用函数，FUN是指定的函数
apply(mymatrix, 1, mean)

# 如果FUN还有其它参数，可以在apply后面指定
apply(mymatrix, 1, mean, trim = 0.2)
