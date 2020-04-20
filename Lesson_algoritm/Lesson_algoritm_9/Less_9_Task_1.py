# Определение количества различных подстрок с использованием хеш-функции. Пусть на вход функции дана строка. Требуется вернуть количество различных подстрок в этой строке.
# * в сумму не включаем пустую строку и строку целиком;
# * без использования функций для вычисления хэша (hash(), sha1() или любой другой из модуля hashlib задача считается не решённой.

import hashlib

def count_str(str):
    if len(str) <= 1:
        return 0
    substr = set()
    for len_substr in range(1, len(str)):
        n = 0
        while len_substr <= len(str[n:]):
            substr.add(hashlib.sha1(str[n:n+len_substr].encode('utf-8')).hexdigest())
            n += 1
    return len(substr)

s = input('Введите строку: ')
print(s)
print('Количество подстрок в Вашей строке = ', count_str(s))