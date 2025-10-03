options(digits = 2)
Student <- c(
  "John Davis", "Angela Williams", "Bullwinkle Moose",
  "David Jones", "Janice Markhammer", "Cheryl Cushing", "Reuven Ytzrhak",
  "Greg Knox", "Joel England", "Mary Rayburn"
)
Math <- c(502, 600, 412, 358, 495, 512, 410, 625, 573, 522)
Science <- c(95, 99, 80, 82, 75, 85, 80, 95, 89, 86)
English <- c(25, 22, 18, 15, 20, 28, 15, 30, 27, 18)
roster <- data.frame(Student, Math, Science, English, stringsAsFactors = FALSE)

# 标准化
z <- scale(roster[, 2:4])

# 求平均分
score <- apply(z, 1, mean)

# 合并列
roster <- cbind(roster, score)

# 取百分位数
y <- quantile(roster$score, c(.8, .6, .4, .2))

# 划分等级
roster$grade <- NA
roster$grade[score >= y[1]] <- "A"
roster$grade[score < y[1] & score >= y[2]] <- "B"
roster$grade[score < y[2] & score >= y[3]] <- "C"
roster$grade[score < y[3] & score >= y[4]] <- "D"
roster$grade[score < y[4]] <- "F"

# 划分名字
name <- strsplit(roster$Student, " ")
FirstName <- sapply(name, "[", 1)
LastName <- sapply(name, "[", 2)

# 合并拆分后的名字列并删除原本的列
cbind(FirstName, LastName, roster[-1])

# 排序
# order函数是R语言中用于对向量进行排序并返回排序后元素在原向量中索引位置的函数
roster[order(LastName,FirstName),]
