from scipy.optimize import fsolve
import numpy as np

def eq(p):
    x, y = p
    return (y - x**2 + 1, np.exp(x)-x*y+x-1)

x_1, y_1 = fsolve(eq, (1,1))
x_2, y_2 = fsolve(eq, (0,0))


print(x_1, y_1)
print(x_2, y_2)