import re

# 1 Получите текст из файла.
text_orign = ''

with open('Tourist_site.txt', 'r') as f:
    text_orign = f.read()

print ('Оригинальный текст:')
print (text_orign)

# 2 Разбейте полученные текст на предложения.
pattern_1 = '[\.!\?]+\s'
text_sentence = re.split(pattern_1, text_orign)

print ()
print ('Текст, разбитый на предложения:')
print (text_sentence)

# 3 Найдите слова, состоящие из 4 букв и более. Выведите на экран 10 самых часто используемых слов. Пример вывода: [(“привет”, 3), (“люди”, 3), (“город”, 2)].
pattern_2 = re.compile('([A-Яа-я]{4,})[\s\.!\?]')
text_letter4 = pattern_2.findall(text_orign)
text_letter4_count = {}

for i in text_letter4:
    text_letter4_count [i] = text_letter4.count(i)

index = 0
text_letter4_count_1 = []

for w in sorted(text_letter4_count, key=text_letter4_count.get, reverse=True):
    index +=1
    if index >10:
        break
    text_letter4_count_1.append((w, text_letter4_count[w]))

print()
print ('10 самых часто используемых слов из 4 и более букв в тексте:')
print (text_letter4_count_1)


# 4 Отберите все ссылки.
pattern_3 = re.compile('\s([\w\.]+/[\w\./]{0,})\s')

print ()
print ('Все ссылки из текста:')
print (pattern_3.findall(text_orign))


# 5 Ссылки на страницы какого домена встречаются чаще всего? Напоминаем, что доменное имя — часть ссылки до первого символа «слеш». Например в ссылке вида travel.mail.ru/travel?id=5 доменным именем является travel.mail.ru. Подсчет частоты сделайте по аналогии с заданием 3, но верните только одну самую частую ссылку.
pattern_4 = re.compile ('(\w+\.?\w{0,}\.?\w{0,}\.?\w{0,})/')
text_5 = re.findall(pattern_4, text_orign)
text_5_count = {}

for i in text_5:
    text_5_count [i] = text_5.count(i)

text_5_count_1 = sorted(text_5_count, key=text_5_count.get, reverse=True)[0]

print()
print('Чаще всего встречаются ссылки на домен: ')
print (text_5_count_1)


# 6 Замените все ссылки на текст «Ссылка отобразится после регистрации».
pattern_6 = re.compile('\s([\w\.]+/[\w\./]{0,})\s')
text_6 = re.sub (pattern_6, '<ссылка отобразится после регистрации> ', text_orign)

print()
print('Текст со скрытыми ссылками: ')
print (text_6)