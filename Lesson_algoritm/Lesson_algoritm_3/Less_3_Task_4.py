# Определить, какое число в массиве встречается чаще всего.

import random

num_1 = [random.randint(1, 5) for i in range (10)]
print(num_1)
n_1 = 0
n_count = 0

for i, n in enumerate(num_1):
    count = 1
    for s in range(i + 1, len(num_1)):
        if num_1[s] == n:
            count += 1
    if count > n_count:
        n_1 = n
        n_count = count

print(f'{n_1} встречается чаще всего - {n_count} раз!' if n_count > 1 else 'Все элементы уникальны!')

