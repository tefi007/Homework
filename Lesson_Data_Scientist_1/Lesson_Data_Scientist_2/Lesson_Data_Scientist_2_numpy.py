import numpy as np
a = np.array([[1, 6], [2, 8], [3, 11], [3, 10], [1, 7]])
print('Массив:')
print(a)
print()

mean_a = np.mean(a, axis = 0)
print('mean_a =', mean_a)
print()

a_centered = a - mean_a
print('a_centered =')
print (a_centered)
print()

n = a_centered.shape[0]
print('n =', n)

a_centered_1 = a_centered[:,0]
a_centered_2 = a_centered[:,1]
a_centered_sp = a_centered_1.dot(a_centered_2)
print('a_centered_sp = ', a_centered_sp)

res = a_centered_sp / (n - 1)
print('res =', res)
print()

a_tr = a.T
c_m = np.cov(a_tr)
print ('a_tr =')
print(a_tr)
print()
print ('c_m =')
print(c_m)
print('ковариация =', c_m[0,1])