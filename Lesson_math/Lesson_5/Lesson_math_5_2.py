import random
import numpy as np
import matplotlib.pyplot as plt

# часть 1

result = [random.randint(0,36) for i in range(100)]                # сгеренированный список 100 выбросов рулетки
count_1 = list(filter(lambda i: i == 1, result))                   # сгеренированный список выпадений 1 из 100 выбросов рулетки
count_2 = list(filter(lambda i: i == 2, result))                   # сгеренированный список выпадений 2 из 100 выбросов рулетки
count_12 = list(filter(lambda i: i == 1 or i == 2, result))        # сгеренированный список выпадений 1 или 2 из 100 выбросов рулетки

print (result)
print(count_1)
print(count_2)
print(count_12)

p_1 = len(list(count_1)) / 100        # вероятность выброса 1 (затем 2, затем 1 или 2)
p_2 = len(list(count_2)) / 100
p_12 = len(list(count_12)) / 100
p_12f = p_1 + p_2                     # вероятность выброса 1 или 2 рассчитанная по формуле сложения

print(f'Вероятность выпадения 1 = {p_1}')
print(f'Вероятность выпадения 2 = {p_2}')
print(f'Вероятность выпадения 1 или 2 = {p_12}')
print(f'Вероятность выпадения 1 или 2 по формуле сложения = {p_12f}')

# часть 2

res_1 = sum(np.random.randint(0,9,10))
res_2 = sum(np.random.randint(0,9,10))
res_3 = sum(np.random.randint(0,9,10))
res_4 = sum(np.random.randint(0,9,10))
res_5 = sum(np.random.randint(0,9,10))
res_6 = sum(np.random.randint(0,9,10))
res_7 = sum(np.random.randint(0,9,10))
res_8 = sum(np.random.randint(0,9,10))
res_9 = sum(np.random.randint(0,9,10))
res_10 = sum(np.random.randint(0,9,10))
res_sum = (res_1, res_2, res_3, res_4, res_5, res_6, res_7, res_8, res_9, res_10)
print(res_sum)
num_bin = 5
plt.hist(res_sum, num_bin)
plt.xlabel('res_sum')
plt.ylabel('probability')
plt.title('Histogram')
plt.show()
