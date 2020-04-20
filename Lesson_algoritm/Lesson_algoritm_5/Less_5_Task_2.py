#  Написать программу сложения и умножения двух шестнадцатеричных чисел. При этом каждое число представляется как массив, элементы которого — цифры числа.
# Например, пользователь ввёл A2 и C4F. Нужно сохранить их как [‘A’, ‘2’] и [‘C’, ‘4’, ‘F’] соответственно.
# Сумма чисел из примера: [‘C’, ‘F’, ‘1’], произведение - [‘7’, ‘C’, ‘9’, ‘F’, ‘E’].
# Примечание: Если воспользоваться функциями hex() и/или int() для преобразования систем счисления, задача решается в несколько строк.
# Для прокачки алгоритмического мышления такой вариант не подходит. Поэтому использование встроенных функций для перевода из одной системы счисления в другую в данной задаче под запретом.
# Вспомните начальную школу и попробуйте написать сложение и умножение в столбик.

import collections

c = '0123456789ABCDEF'
n = collections.Counter()
for i in range(16):
    n[c[i]] = i
#print(n)

a = list(input('Введите первое число в 16-ричной системе: '))
b = list(input('Введите второе число в 16-ричной системе: '))
print(f'Первое число{a}')
print(f'Второе число{b}')

if len(b) > len(a):
    a, b = b, a

a.reverse()
b.reverse()
#print(a)
#print(b)

summary = []
multiply = []
var = 0
var_1 = 0

for i in range(len(a)):
    if i < len(b):
        var = n[a[i]] + n[b[i]] + var_1
        var_1 = 0
        if var > 15:
            var = var - 16
            var_1 = 1
        summary.append(c[var])
    else:
        var = n[a[i]] + var_1
        var_1 = 0
        if var > 15:
            var = var - 16
            var_1 = 1
        summary.append(c[var])

if var_1 != 0:
    summary.append(c[var_1])

a_1 = 0
for i in range(len(a)):
    a_1 += n[a[i]] * (16**i)
b_1 = 0
for i in range(len(b)):
    b_1 += n[b[i]] * (16**i)

m_1 = a_1 * b_1
multiply = []

while m_1 > 15:
    multiply.append(c[m_1 % 16])
    m_1 = m_1 // 16
multiply.append(c[m_1 % 16])

summary.reverse()
multiply.reverse()
print(f'Сумма чисел = {summary}')
print(f'Произведение чисел = {multiply}')