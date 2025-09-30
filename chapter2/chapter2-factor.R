# 变量分为 分类变量和连续型变量
# 分类变量又分为名义变量和顺序变量，分类变量在R语言中叫因子 factor


# 创建一个名义变量：性别
gender1 <- factor(c("男", "女", "女", "男"))
print(gender1)

gender2 <- factor(c("Man", "Women", "Women", "Man"))
print(gender2)

# 为什么gender1展示的顺序是“女 男”，gender2展示的顺序是“男 女”？
# 什么是字典序？字典序是基于字符的 Unicode 编码值来确定先后顺序的方法


# 分别获取 "男"、"女" 的 UTF - 8 编码
male_code <- utf8ToInt("男")
print(male_code)
female_code <- utf8ToInt("女")
print(female_code)

# 获取 "Man"、"Women" 的 UTF - 8 编码
male_code <- utf8ToInt("Man")
print(male_code)
female_code <- utf8ToInt("Women")
print(female_code)



# 创建一个顺序变量：满意度
satisfaction <- factor(c("满意", "非常满意", "一般", "不满意"), 
                       levels = c("非常不满意", "不满意", "一般", "满意", "非常满意"),
                       ordered = TRUE)
print(satisfaction)

# 查看因子的水平
levels(satisfaction)

# 查看因子的内部编码
str(as.integer(satisfaction))


















