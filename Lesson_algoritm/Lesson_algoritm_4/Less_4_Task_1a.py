# В диапазоне натуральных чисел от 2 до i определить, сколько из них кратны каждому из чисел в диапазоне от 2 до 9. Примечание: 8 разных ответов.

#import cProfile

def multiple_1(i):
    num = {n: 0 for n in range(2, 10)}
    for n_1 in range (2, i+1):
        for n_2 in range (2, 10):
            num[n_2] += 1 if n_1 % n_2 == 0 else 0

    for key, val in num.items():
        num[key] = val
    return num

#print(multiple_1(100))
#cProfile.run('multiple_1(10000)')

'''
multiple_1(100)
1000 loops, best of 5: 122 usec per loop
   6 function calls in 0.000 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.000    0.000 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 Less_4_Task_1a.py:5(multiple_1)
        1    0.000    0.000    0.000    0.000 Less_4_Task_1a.py:6(<dictcomp>)
        1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}


multiple_1(1000)
1000 loops, best of 5: 14 msec per loop
   6 function calls in 0.001 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.001    0.001 <string>:1(<module>)
        1    0.001    0.001    0.001    0.001 Less_4_Task_1a.py:5(multiple_1)
        1    0.000    0.000    0.000    0.000 Less_4_Task_1a.py:6(<dictcomp>)
        1    0.000    0.000    0.001    0.001 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}


multiple_1(10000)
1000 loops, best of 5: 9.2 nsec per loop
   6 function calls in 0.029 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.029    0.029 <string>:1(<module>)
        1    0.029    0.029    0.029    0.029 Less_4_Task_1a.py:5(multiple_1)
        1    0.000    0.000    0.000    0.000 Less_4_Task_1a.py:6(<dictcomp>)
        1    0.000    0.000    0.029    0.029 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}
'''