# 矩阵是一个二维数组，其元素数据类型必须一致
# 使用matrix函数创建矩阵，其接受一个向量参数来构建矩阵
# nrow 和 ncol 参数用于指定行列的数量
# byrow 参数指定是否按行填充，dimnames 用于指定行列的名称

my_matrix1 <- matrix(c(1, 2, 3, 4, 5, 6),
  nrow = 2, ncol = 3, byrow = TRUE,
  dimnames = list(c("R1", "R2"), c("C1", "C2", "C3"))
)

print(my_matrix1)

my_matrix2 <- matrix(c(1, 2, 3, 4, 5, 6),
  nrow = 2, ncol = 3, byrow = FALSE,
  dimnames = list(c("R1", "R2"), c("C1", "C2", "C3"))
)

print(my_matrix2)



my_matrix3 <- matrix(1:16, nrow = 4, ncol = 4)

print(my_matrix3)

# 访问某行
print(my_matrix3[3, ])

# 访问某列
print(my_matrix3[, 4])

# 访问某行某列的指定元素
print(my_matrix3[3, 3])

# 选择多行或者多列时，索引可以是数值型向量
print(my_matrix3[2, c(3, 4)])
