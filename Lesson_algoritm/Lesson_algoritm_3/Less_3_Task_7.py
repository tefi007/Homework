# В одномерном массиве целых чисел определить два наименьших элемента. Они могут быть как равны между собой (оба минимальны), так и различаться.

import random

num_1 = [random.randint(-10, 10) for i in range (10)]
print(num_1)

min_1 = num_1[0]
min_2 = num_1[0]

for i, n in enumerate(num_1):
    if n < min_1:
        min_2 = min_1
        min_1 = n
    elif n < min_2:
        min_2 = n

print(f'min_1 = {min_1}, min_2 = {min_2}')