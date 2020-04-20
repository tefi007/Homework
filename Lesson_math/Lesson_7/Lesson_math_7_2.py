import numpy as np
import matplotlib.pyplot as plt


x = np.linspace(0, 3, 201)
plt.plot(x, ( ((-3/10) * x) - 2/10) )
plt.plot(x, ( ((3/4) * x) - 7/4) )
plt.plot(x, ( ((44/25) * x) - 74/25) )
plt.plot(x, ( ((-41/20) * x) + 26/20) )


A = np.array([[1, 2, -1], [3, -4, 0], [8, -5, 2], [2, 0, -5], [11, 4, -7]])
B = np.array([1, 7, 12, 7, 15])
print(np.linalg.lstsq(A, B))


plt.show()