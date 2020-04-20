import math
import numpy as np
import matplotlib.pyplot as plt


x = np.linspace(-1.0, 1.0, 100)
y = np.linspace(-0.8, 0.8, 100)
X, Y = np.meshgrid(x,y)
F = X**2 + Y**2 - 0.5
plt.contour(X,Y,F,[0])


x_1 = np.linspace(-1.0, 1.0, 100)
y_1 = np.linspace(-0.8, 0.8, 100)
X_1, Y_1 = np.meshgrid(x_1,y_1)
F = X_1**2/0.2 + Y_1**2/0.05 - 0.9
plt.contour(X_1,Y_1,F,[0])


x_2 = np.linspace(-1.0, 1.0, 100)
y_2 = np.linspace(-0.8, 0.8, 100)
X_2, Y_2 = np.meshgrid(x_1,y_1)
F = X_2**2/0.04 - Y_2**2/0.08 - 0.5
plt.contour(X_2,Y_2,F,[0])


plt.show()