import numpy as np
import matplotlib.pyplot as plt


x = np.linspace(0, 10, 100)
plt.plot(x, np.cos(x), marker="o")
plt.plot(x, np.cos(2*x), marker="v")
# print(x)
plt.show()