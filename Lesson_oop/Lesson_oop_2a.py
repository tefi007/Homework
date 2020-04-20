import re

with open('index.htm', 'r', encoding='utf-8') as f:
    text_original = f.read()

#print(text_original)

pattern = re.compile('<span class="total-users">Нас уже ([\d ]+) человек</span>')
print('Количество студентов GeekBrains: ', pattern.findall(text_original))

