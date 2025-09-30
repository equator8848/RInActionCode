# 在R语言中，数组和矩阵类似，但是其维度可以大于2，其元素数据类型必须一致
# 数组是矩阵的自然推广，可以理解为给最常用的二维数组取了单独的名字叫矩阵
my_array <- array(
  1:18, c(2, 4, 2),
  list(
    c("A1", "A2"),
    c("B1", "B2", "B3", "B4"),
    c("C1", "C2")
  )
)
print(my_array)

print(my_array[1, , ])

print(my_array[, 1, ])

print(my_array[, , 1])

print(my_array[1, 3, 2])
