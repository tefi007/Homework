import itertools
import math
import numpy as np


k = 0
n = 1000
res_1 = np.random.randint(0, 2, n)
res_2 = np.random.randint(0, 2, n)
res_3 = np.random.randint(0, 2, n)
res_4 = np.random.randint(0, 2, n)
res_i = res_1 + res_2 + res_3 + res_4
for i in range (0, n):
    if res_i[i] == 2:
        k += 1

n_1 = 4
k_1 = 1
c = math.factorial(n_1) / (math.factorial(k_1) * math.factorial(n_1 - k_1))
p_1 = 6 / 16    # существует 16 вариантов суммы из которых нас утраивает только 6 вар (в которых сумма = 2)
p = c * (p_1**k_1) * ((1 - p_1)**(n_1 - k_1))


print('Вероятность практика:', k/n)
print('Вероятность по формуле Бернулли:', p)


# часть 2
n_11 = 4
k_11 = 3
c_1 = math.factorial(n_11) / (math.factorial(k_11) * math.factorial(n_11 - k_11))
p_11 = 6 / 16    # существует 16 вариантов суммы из которых нас утраивает только 6 вар (в которых сумма = 2)
p_p = c_1 * (p_11**k_11) * ((1 - p_11)**(n_11 - k_11))
print('Вероятность по формуле Бернулли (3):', p_p)