# Сформировать из введенного числа обратное по порядку входящих в него цифр и вывести на экран. Например, если введено число 3486, надо вывести 6843.
# Пользователь вводит только натуральные числа.


# вариант 1
num = int(input('Ввведите любое натуральное число: '))
print(num)
num_new = ''

while num > 0:
    num_new += str(num % 10)
    num //= 10

print(num_new)


# вариант 2
# код без использования строк (теряется 0 в конце: 1230  и 321)

num_1 = int(input('Ввведите любое натуральное число: '))
print(num_1)
num_new_1 = 0
i_1 = 10

while num_1 > 0:
    bal_1 = num_1 % 10
    num_new_1 = (num_new_1 * i_1) + bal_1
    num_1 //= 10

print(num_new_1)

# вариант 3

num_2 = int(input('Ввведите любое натуральное число: '))
print(num_2)
num_new_2 = 0
i_2 = 10

while num_2 > 0:
    bal_1 = num_2 % 10
    num_new_2 = (num_new_2 * i_2) + bal_2
    num_2 //= 10

print(num_new_2)