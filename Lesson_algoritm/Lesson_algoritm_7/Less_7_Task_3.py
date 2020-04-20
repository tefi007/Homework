# Массив размером 2m + 1, где m — натуральное число, заполнен случайным образом. Найдите в массиве медиану.
# Медианой называется элемент ряда, делящий его на две равные части: в одной находятся элементы, которые не меньше медианы, в другой — не больше медианы.
# Примечание: задачу можно решить без сортировки исходного массива. Но если это слишком сложно, используйте метод сортировки,
# который не рассматривался на уроках (сортировка слиянием также недопустима).

import random

def mediana(array):
    more = 0
    less = 0
    for i in range(len(array)):
        for j in range(len(array)):
            if array[j] < array[i]:
                less += 1
            elif array[j] > array[i]:
                more += 1
        if less == more:
            return array[i]
        else:
            more = 0
            less = 0

size = 5
mas = [random.randint(0, 100) for i in range(2 * size + 1)]

# mas = [1,2,3,3,4]

print(mas)
if mediana(mas) == None:
    print('В данном массиве медианы не существует!')
else:
    print('Медиана =', mediana(mas))
