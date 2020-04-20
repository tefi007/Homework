# В диапазоне натуральных чисел от 2 до 99 определить, сколько из них кратны каждому из чисел в диапазоне от 2 до 9. Примечание: 8 разных ответов.

num = {n: 0 for n in range(2, 10)}

for n_1 in range (2, 100):
    for n_2 in range (2, 10):
        num[n_2] += 1 if n_1 % n_2 == 0 else 0

for key, val in num.items():
    print (f'{key} - {val}')
