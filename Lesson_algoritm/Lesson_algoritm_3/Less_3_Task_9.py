# Найти максимальный элемент среди минимальных элементов столбцов матрицы.

import random

matrix = [[random.randint(0, 100) for j in range(4)] for i in range(5)]

for i in range(5):
    for j in range(4):
        print(f'{matrix[i][j]:>4}', end='')
    print()


max = 0

for j in range(4):
    min = matrix[0][j]
    for i in range(5):
        min = matrix[i][j] if matrix[i][j] < min else min
    max = min if min > max else max

print()
print(f'Максимальный элемент среди минимальных элементов столбцов матрицы - {max}')


