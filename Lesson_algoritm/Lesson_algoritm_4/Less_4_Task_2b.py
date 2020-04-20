#import cProfile

def simple_2(i):

    seive = [2]
    n = 2
    while len(seive) != i:
        n += 1
        for m in range(2, n):
            if n % m == 0:
                break
        else:
            seive.append(n)

    return seive[i - 1]

#print (simple_2(100))
#cProfile.run('simple_2(1000)')

'''
simple_2(10)
1000 loops, best of 5: 18 usec per loop
   41 function calls in 0.000 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.000    0.000 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 Less_4_Task_2b.py:3(simple_2)
        1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
       28    0.000    0.000    0.000    0.000 {built-in method builtins.len}
        9    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}


simple_2(100)
1000 loops, best of 5: 1.46 msec per loop
   643 function calls in 0.002 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.002    0.002 <string>:1(<module>)
        1    0.002    0.002    0.002    0.002 Less_4_Task_2b.py:3(simple_2)
        1    0.000    0.000    0.002    0.002 {built-in method builtins.exec}
      540    0.000    0.000    0.000    0.000 {built-in method builtins.len}
       99    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}


simple_2(1000)
10 loops, best of 5: 212 msec per loop
   8921 function calls in 0.254 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.254    0.254 <string>:1(<module>)
        1    0.253    0.253    0.254    0.254 Less_4_Task_2b.py:3(simple_2)
        1    0.000    0.000    0.254    0.254 {built-in method builtins.exec}
     7918    0.001    0.000    0.001    0.000 {built-in method builtins.len}
      999    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
'''