import itertools
import math
import numpy as np
import matplotlib.pyplot as plt

n = 100
r = 0.7
x = np.random.rand(n)
y = r*x + (1 - r)*np.random.rand(n)
plt.plot(x, y, 'o')
plt.xlabel('x')
plt.ylabel('y')
plt.grid(True)


a = (np.sum(x)*np.sum(y) - n*np.sum(x*y))/(np.sum(x)*np.sum(x) - n*np.sum(x*x))
b = (np.sum(y) - a*np.sum(x))/n

A = np.vstack([x, np.ones(len(x))]).T
a1, b1 = np.linalg.lstsq(A, y)[0]
print(a,b)
print(a1, b1)
plt.plot([0, 1],[b, a + b])


# Подсчет коэффициента корреляции

x_s = sum(x)
y_s = sum(y)
x_m = x_s/n
y_m = y_s/n
sum_1 = 0
sum_x2 = 0
sum_y2 = 0

for i in range(n):
    sum_1 = sum_1 + ((x[i]-x_m) * (y[i]-y_m))
    sum_x2 = sum_x2 + ((x[i]-x_m)**2)
    sum_y2 = sum_y2 + ((y[i]-y_m)**2)


sum_xy2 = math.sqrt(sum_x2 * sum_y2)

r = sum_1 / sum_xy2

print('Коэффициент корреляции = ', r)


plt.show()