# В массиве случайных целых чисел поменять местами минимальный и максимальный элементы.

import random

num_1 = [random.randint(1,100) for i in range (10)]
print(num_1)
max = [0, 0]
min = [0, num_1[1]]

for i, n in enumerate(num_1):
    if n > max[1]:
        max = [i, n]
    if n < min[1]:
        min = [i, n]

print(max, min)

if max[0] > min[0]:
    num_1[max[0]] = min[1]
    num_1[min[0]] = max[1]
else:
    num_1[min[0]] = max[1]
    num_1[max[0]] = min[1]

print(num_1)