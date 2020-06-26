# install.packages('cluster')
library(cluster)
head(votes.repub)                      # сколько голосов набрали республиканцы по разным штатам в разные годы
str(votes.repub)
votes.repub[1:6,1:10]
colMeans(votes.repub)                  # среднее арифм по всем столбцам (если хоть одно значение NA - выдает NA)
colMeans(votes.repub, na.rm = TRUE)    # среднее арифм по всем столбцам (NA - не учитывается)

mean(votes.repub[,30], na.rm = TRUE)   # среднее арифм 30 столбца

# полная запись if-else:

if (mean(votes.repub[,30], na.rm = TRUE)>60) {
  print('Республиканцы набрали более 60% голосов.')
} else {
  print('Республиканцы набрали менее 60% голосов.')
}

# краткая запись ifelse(test, yes, no):

ifelse(mean(votes.repub[,30], na.rm = TRUE)>60, 'Республиканцы набрали более 60% голосов.', 'Республиканцы набрали менее 60% голосов.')

ifelse(colMeans(votes.repub, na.rm = TRUE)>60, 'Республиканцы набрали более 60% голосов.', 'Республиканцы набрали менее 60% голосов.')

# install.packages('lubridate')        # библиотека для работы с датами
library(lubridate)
?lubridate

data_1 <- read.csv("dat.csv")          # прочитать файл в переменную
class(data_1)
head(data_1)                           # первый столбец продублирован
dim(data_1)                            # размерность переменной
str(data_1)                            # дата - символьный вектор
unique(data_1$d.date)                  # даты продаж
unique(data_1$ball)                    # кол-во мячей в упаковке
unique(data_1$price)                   # цены

data_1 <- data_1[,-1]                  # удалить 1 столбец (повторяющийся)
head(data_1)
data_1_date <- ymd(data_1$d.date)      # функция ymd (год, мес, день) из пакета lubridate - записать в переменную данные в виде даты 
class(data_1_date)
data_1_date
data_1$d.date <- ymd(data_1$d.date)    # функция ymd (год, мес, день) из пакета lubridate - столбец с датой теперь имеет тип дата
str(data_1)
head(data_1)

year(data_1$d.date)                    # вывести только год
month(data_1$d.date)                   # вывести только месяц 
day(data_1$d.date)                     # вывести только день

data_1$price[day(data_1$d.date) == 1]       # какие чеки были пробиты 1 числа 
sum(data_1$price[day(data_1$d.date) == 1])  # выручка за 1 число

# создание функции по подсчету выручки в заданный день:

func_1 <- function(day){
  sum(data_1$price[day(data_1$d.date) == day])
}

func_1(1)     # выручка за 1 число
func_1(2)     # выручка за 2 число
func_1(3)     # выручка за 3 число

sum(func_1(1), func_1(2), func_1(3))   # выручка за все дни

# создание функции с return:

func_2 <- function(day){
  d_1 <- sum(data_1$price[day(data_1$d.date) == day])
  return(d_1)
}

func_2(1)

func_3 <- function(mon, d){
  d_2 <- sum(data_1$price[month(data_1$d.date)==mon & day(data_1$d.date)==d]) 
  return(d_2)
}

func_3(1,1)

# цикл for

for(i in 1:3){
  print(func_1(i))
}

# функция apply(X, MARGIN, FUN, ...) (массив, 1 - к строкам 2 к столбцам, применяемая функция) 
head(votes.repub)      
?apply(array, margin, ...)
apply(votes.repub, 1, mean)   # среднее ариф по строкам
apply(votes.repub, 2, mean)   # среднее ариф по столбцам

lapply(votes.repub, sum)                        # сумма по столбцам преобразованная в список(list)
unlist(lapply(votes.repub, sum))                # сумма по столбцам "numeric" с заголовками
as.numeric(unlist(lapply(votes.repub, sum)))    # сумма по столбцам "numeric" вектор без заголовков


sapply(votes.repub, sum)                        # сумма по столбцам "numeric" с заголовками
as.numeric(sapply(votes.repub, sum))            # сумма по столбцам "numeric" вектор без заголовков

a <- c(2,3,5,8,5)
diff(a)                # разница между элементами n+1 и n
range(a)               # минимальное и максимальное значения
diff(range(a))         # разница между минимальным и максимальным членами

head(Orange, 12)
func_5 <- function(x){diff(range(x))}  # функция определяющая разницу между минимумом и максимумом 
func_5(a)

# tapply(vector, index, function)  считает функцию по подгруппам и упорядочивает результат по возрастанию
tapply(Orange$circumference, Orange$Tree, func_5)  # 1-й аргумент что считаем по подгруппам, 2-й по какому столбцу подгруппы

# Симуляция Монте-Карло (надо достать ровно 3 белых мяча)
a <- c(rep(1,5), rep(0,3))   # 5 белых и 3 черных шарика в 1 коробке
b <- c(rep(1,5), rep(0,7))   # 5 белых и 7 черных шарика во 2 коробке
a_1 <- sample(a, 2)          # перемешиваем и достаем 2 мячика из 1 коробки
b_1 <- sample(b, 4)          # перемешиваем и достаем 4 мячика из 2 коробки
a_1
b_1
c_1 <- c(a_1, b_1)           # совмещаем шарики вместе
c_1
s_1 <- sum(c_1)              # кол-во белых мячей ()
s_1

func_6 <- function(n,m){
  a_a <- sample(a, n)
  b_b <- sample(b, m)
  s_s <- sum(c(a_a, b_b))
  return(s_s)
}

func_6(2,4)                  # функция подсчета белых шариков в опыте

m_c <- replicate(100000, func_6(2,4))    # проведем опыт 100 раз и запишем результаты в вектор
m_c
mean(m_c==3)          # доля значений равных 3, вероятность того что вытащим ровно 3 белых мяча

# install.packages('dplyr')
library(dplyr)

dim(iris)             # размерность данных
iris %>% dim          # оператор pipe - передать переменную в функцию

iris %>% filter(Species=='versicolor')   # передать переменную в функцию, фильтрующую по результату столбца
iris %>% filter(Species=='versicolor') %>% select(Petal.Length)  # полученный результат передать в следующую функцию, вывесть только нужный столбец
iris %>% filter(Species=='versicolor') %>% select(Petal.Length) %>% unlist  # результат вывесть в виде вектора
iris %>% filter(Species=='versicolor') %>% select(Petal.Length) %>% unlist %>% as.numeric  # убрать название столбцов

v_1 <- iris %>% filter(Species=='versicolor') %>% select(Petal.Length) %>% unlist %>% as.numeric
v_1
v_2 <- iris %>% filter(Species=='virginica') %>% select(Petal.Length) %>% unlist %>% as.numeric
v_2

v_1 %in% v_2   # присутствуют ли значения вектора v_1 в векторе v_2

sum (v_1 %in% v_2)      # сумма TRUE т.е. совпадающих значений
v_1 %in% v_2 %>% sum    # с помощью pipe

v_2 %in% v_1            # не эквивалентно v_1 %in% v_2


a <- c(1,2,3)
b <- c('a','b','c')
name <- paste0(seq(1,3), '-', 'row') 
df <- data.frame(a,b, row.names = name)
df
write.csv(df, file = 'df_test.csv')   # запись датафрейма в файл по умолч разделитель ','
read.csv('df_test.csv')               # чтение из файла по умолч разделитель','
read.csv2('df_test.csv')              # чтение из файла по умолч разделитель ';' прочитальсь с ошибкой
read.csv2('df_test.csv', sep = ',')   # прочитальсь верно

?read.csv
df_1 <- read.csv('df_test.csv', sep = ',', nrows = 2, row.names = 1)  # записать только 2 строки, название 1 столбца сделать заголовками строк
df_1
df_1 <- read.csv('df_test.csv', sep = ',', nrows = 5, header = FALSE)  # убрать заголовки столбцов
df_1

# install.packages('readxl')    # чтение xls файлов
library(readxl)
?read_xls()                     # чтение xls файлов

# install.packages('rio')       # чтение файла с автоматическим определением параметров и формата
library(rio)
import('df_test.csv')           # чтение файла с автоматическим определением параметров и формата

# install.packages('rvest')
library(rvest)
url_1 <- 'https://cdas.cancer.gov/datasets/nlst/'    # создание переменной с адресом url
url_1
data_1 <- read_html(url_1)                           # прочитать код страницы
data_1
data_tabl_1 <- data_1 %>% html_nodes('table')        # найти таблицу в коде
data_tabl_1
d <- data_tabl_1[[1]] %>% html_table                 # загружаем первую таблицу
head(d)
class(d)
d <- d %>% setNames(c('data', 'discription'))        # присваиваем имена столбцам
d
d$data                                               # первый столбец
d_1 <- sub(pattern = '\n            \n            ', replacement = ' ', d$data)    # вырезать паттерн и заменить его на replacement
d_1
d_11 <- strsplit(d_1[1], split = NULL)               # разделить посимвольно первый элемент
length(unlist(d_11))                                 # количество символов
substr(d_1[1], start = 6, stop = 15)                 # посмотреть с 6 по 15 символ
substr(d_1, start = 6, stop = 15)                    # посмотреть с 6 по 15 символ во всех элементах вектора
dict <- paste0('Dictionary_number', set=' ', 1:15)   # пронумерованные словари
dict

discr <- d[2]
discr
discr_1 <- sub(pattern = "\n                \n                    ", replacement = ' ', discr)
discr_1 <- sub(pattern = "\\n                \\n                    ", replacement = ' ', discr_1)
discr_1


library(dplyr)
a <- c(1,2,3)
b <- c(4,5,6)
data_frame(tolower(a),b)   # создание датафрейма tolower - возможно? текстовой вектор