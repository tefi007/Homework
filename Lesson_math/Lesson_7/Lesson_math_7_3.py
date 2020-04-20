import numpy as np
import matplotlib.pyplot as plt

A = np.array([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
B = np.array([[12, 2, 1]])
C = np.concatenate((A,B.T), axis=1)
print(C)

print(np.linalg.matrix_rank(A, 0.0001), np.linalg.matrix_rank(C, 0.0001))

print('Система не имеет ни одного решения.')

print()

B_1 = np.array([[12, 15, 18]])
C_1 = np.concatenate((A,B_1.T), axis=1)
print(C_1)
print(np.linalg.matrix_rank(A, 0.0001), np.linalg.matrix_rank(C_1, 0.0001))
print('Теперь система имеет бесконечно много решений.')