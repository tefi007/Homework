import numpy as np
import matplotlib.pyplot as plt


x = np.linspace(0, 10, 100)
k = 1
a = 1
b = 1
k_1 = 3
a_1 = 3
b_1 = 3
k_2 = 1
a_2 = 3
b_2 = 1

plt.plot(x, np.cos(x-a)*k+b)
plt.plot(x, np.cos(x-a_1)*k_1+b_1)
plt.plot(x, np.cos(x-a_2)*k_2+b_2)

plt.show()

