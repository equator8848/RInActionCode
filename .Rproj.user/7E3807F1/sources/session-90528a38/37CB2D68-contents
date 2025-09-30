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
score_column <- c("Math", "Science", "English")
roster[, score_column] <- scale(roster[, score_column])

# 先把名称分隔，然后转换为矩阵，再提取列
name_matrix <- matrix(unlist(strsplit(Student, " ")),
  nrow = length(Student), ncol = 2, byrow = TRUE
)

roster <- dplyr::mutate(roster,
  FirstName = name_matrix[, 1],
  LastName = name_matrix[, 2],
  TotalScore = Math + Science + English
)

# 把FirstName, LastName放到前面，并删除原本的名称字段
roster <- dplyr::relocate(roster, FirstName, LastName, .before = Student)
roster <- roster[-3]

# 求取分位数
watershed <- quantile(roster$TotalScore, seq(0, 1, 0.2))

# 划分等级
roster <- within(roster, {
  level <- NA
  level[TotalScore >= watershed[[5]]] <- "A"
  level[TotalScore >= watershed[[4]] & TotalScore < watershed[[5]]] <- "B"
  level[TotalScore >= watershed[[3]] & TotalScore < watershed[[4]]] <- "C"
  level[TotalScore >= watershed[[2]] & TotalScore < watershed[[3]]] <- "D"
  level[TotalScore < watershed[[2]]] <- "E"
})

# 按照名称排序
roster <- roster[order(roster$LastName, roster$FirstName), ]
