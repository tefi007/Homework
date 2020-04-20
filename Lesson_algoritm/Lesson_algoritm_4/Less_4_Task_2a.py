#import cProfile

def simple_1(m):
    seive = [i for i in range(m * 100)]
    seive[1] = 0

    for i in range(2, m * 100):
        if seive[i] != 0:
            j = i * 2

            while j < (m * 100):
                seive[j] = 0
                j += i

    result = [i for i in seive if i != 0]
    return result[m-1]

#print(simple_1(100))
#cProfile.run('simple_1(1000)')

'''
simple_1(10)
1000 loops, best of 5: 336 usec per loop
   6 function calls in 0.001 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.001    0.001 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 Less_4_Task_2a.py:15(<listcomp>)
        1    0.001    0.001    0.001    0.001 Less_4_Task_2a.py:3(simple_1)
        1    0.000    0.000    0.000    0.000 Less_4_Task_2a.py:4(<listcomp>)
        1    0.000    0.000    0.001    0.001 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}


simple_1(100)
1000 loops, best of 5: 3.98 msec per loop
   6 function calls in 0.005 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.005    0.005 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 Less_4_Task_2a.py:15(<listcomp>)
        1    0.004    0.004    0.005    0.005 Less_4_Task_2a.py:3(simple_1)
        1    0.000    0.000    0.000    0.000 Less_4_Task_2a.py:4(<listcomp>)
        1    0.000    0.000    0.005    0.005 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}


simple_1(1000)
1000 loops, best of 5: 54 msec per loop
   6 function calls in 0.050 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.002    0.002    0.050    0.050 <string>:1(<module>)
        1    0.003    0.003    0.003    0.003 Less_4_Task_2a.py:15(<listcomp>)
        1    0.041    0.041    0.048    0.048 Less_4_Task_2a.py:3(simple_1)
        1    0.005    0.005    0.005    0.005 Less_4_Task_2a.py:4(<listcomp>)
        1    0.000    0.000    0.050    0.050 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
'''