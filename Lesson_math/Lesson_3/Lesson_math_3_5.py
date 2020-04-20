import numpy as np
from mpl_toolkits.mplot3d import Axes3D
import matplotlib.pyplot as plt
from pylab import *

fig_1 = plt.figure()
ax_1 = fig_1.add_subplot(111, projection='3d')
x_1 = y_1 = np.arange(-3.0, 3.0, 0.05)
X_1, Y_1 = np.meshgrid(x_1, y_1)
Z_1 = np.sqrt(X_1**2 + Y_1**2)

ax_1.plot_surface(X_1, Y_1, Z_1)

ax_1.set_xlabel('X_1 Label')
ax_1.set_ylabel('Y_1 Label')
ax_1.set_zlabel('Z_1 Label')


fig_1 = plt.figure()
ax_1 = fig_1.add_subplot(111, projection='3d')
x_1 = y_1 = np.arange(-3.0, 3.0, 0.05)
X_1, Y_1 = np.meshgrid(x_1, y_1)
Z_1 = X_1**2 + Y_1**2

ax_1.plot_surface(X_1, Y_1, Z_1)

ax_1.set_xlabel('X_1 Label')
ax_1.set_ylabel('Y_1 Label')
ax_1.set_zlabel('Z_1 Label')

plt.show()