# Даны три множества a,b и с. Необходимо выполнить все изученные виды бинарных операций над всеми комбинациями множеств.

from itertools import *

a = set(range(1,7))
b = set(range(5,11))
c = set([x for x in range(1,11) if x % 2 == 0])

print(a, b, c, sep='\n')
print('#' * 30)

def set_operation(x, y):
    union = x.union(y)
    intersection = x.intersection(y)
    difference_1 = x.difference(y)
    difference_2 = y.difference(x)
    print(f'Объединение {x} и {y} :   {union}')
    print(f'Пересечение {x} и {y} :   {intersection}')
    print(f'Разность    {x} и {y} :   {difference_1}')
    print(f'Разность    {y} и {x} :   {difference_2}')

list_set = [a, b, c]

for i in combinations(list_set, 2):
    set_operation(i[0], i[1])
    print('#' * 30)
    #print(i, end=' ')