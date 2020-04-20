import numpy as np
import matplotlib.pyplot as plt

A = np.array([[1, 2, 3], [4, 0, 6], [7, 8, 9]])
B = np.array([12, 2, 1])


print(np.linalg.solve(A, B))
print()
print('Решение через обратную матрицу:')
A_1 = np.linalg.inv(A)
print(np.dot(A_1, B))
