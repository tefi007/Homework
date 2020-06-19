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
dim(data_1)
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

func_3 <- function(month, day){
  sum(data_1$price[month(data_1$d.date)==month] & data_1$price[day(data_1$d.date)==day])
}

func_3(1,1)
