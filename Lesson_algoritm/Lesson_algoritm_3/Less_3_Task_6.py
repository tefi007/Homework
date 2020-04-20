# В одномерном массиве найти сумму элементов, находящихся между минимальным и максимальным элементами. Сами минимальный и максимальный элементы в сумму не включать.

import random

num_1 = [random.randint(1,100) for i in range (10)]
print(num_1)
max = [0, 0]
min = [0, num_1[1]]
sum = 0

for i, n in enumerate(num_1):
    if n > max[1]:
        max = [i, n]
    if n < min[1]:
        min = [i, n]

print(max, min)

if max[0] > min[0]:
    a, b = min[0], max[0]
else:
    a, b = max[0], min[0]


for i in range (a + 1, b):
    sum += num_1[i]

print(sum)