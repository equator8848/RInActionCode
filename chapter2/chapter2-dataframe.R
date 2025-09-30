id <- c(1, 2, 3, 4)
name <- c("Java", "Python", "Golang", "R")
score <- c(100, 80, 70, 60)

# 和矩阵不一样的是，数据框的每列元素类型不必一致，这更加符合实际的数据集场景。
# 数据框某列内的元素类型是需要一致的。
programming_skill <- data.frame(id, name, score)

programming_skill

# 数据框的访问
programming_skill[2,3]

programming_skill[2,]

programming_skill[,3]

programming_skill["name"]

programming_skill$score


# 使用with函数可实现在{}中直接使用列名访问某列数据（领域展开）
with(programming_skill,{
  score_sum1 <- sum(score)
  score_sum1
})

score_sum1

# 使用<<-可将领域中定义的变量保存到全局变量
with(programming_skill,{
  score_sum2 <<- sum(score)
  score_sum2
})

score_sum2








