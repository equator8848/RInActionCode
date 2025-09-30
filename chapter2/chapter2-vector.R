# 标量（scalar），只有一个元素的向量
name <- "小虾米"

# 向量（vector）是个一维数组，通过字面量的形式声明一个向量，单个向量中的数据类型必须完全一致
skills <- c("C", "Java", "Python", "Golang")

# 访问向量，如果索引是负数，则是删除对应位置的元素
skills <- skills[-1]

# 访问第一个元素
skills[1]

# 访问0，不会报错，但是结果没意义
skills[0]

# 访问一个不存在的索引，返回NA
skills[4]

# 新增一个元素
skills <- append(skills, "R")

skills

# 切片访问
skills[2:4]

# 访问指定位置的元素
skills[c(1, 2, 4)]
