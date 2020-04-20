import math
import numpy as np
import matplotlib.pyplot as plt


x = np.linspace(-1.0, 1.0, 100)
y = np.linspace(-0.8, 0.8, 100)
X, Y = np.meshgrid(x,y)
F = X**2 + Y**2 - 0.5
plt.contour(X,Y,F,[0])

x1, y1 = [-0.5, 0.8], [0.2, 0.5]
plt.plot(x1, y1, marker = 'o')


s = np.pi/2
x_1 = x*np.cos(s) + y*np.sin(s)
y_1 = -x*np.sin(s) + y*np.cos(s)
X_1, Y_1 = np.meshgrid(x_1,y_1)
plt.contour(X_1,Y_1,F,[0])


x1, y1 = [-0.5*np.cos(s), 0.8*np.sin(s)], [0.2*np.sin(s), 0.5*np.cos(s)]
plt.plot(x1, y1, marker = 'o')

plt.show()