#import cProfile

def simple_3(i):
    import math

    seive = [2]
    n = 1
    while len(seive) != i:
        n += 2
        for m in range(2, int(math.sqrt(n) + 1)):
            if n % m == 0:
                break
        else:
            seive.append(n)

    return seive[i - 1]

#print (simple_3(100))
#cProfile.run('simple_3(1000)')

'''
simple_2(10)
1000 loops, best of 5: 11.2 usec per loop
   42 function calls in 0.000 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.000    0.000 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 Less_4_Task_2c.py:3(simple_3)
        1    0.000    0.000    0.000    0.000 {built-in method builtins.exec}
       15    0.000    0.000    0.000    0.000 {built-in method builtins.len}
       14    0.000    0.000    0.000    0.000 {built-in method math.sqrt}
        9    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}


simple_2(100)
1000 loops, best of 5: 273 usec per loop
   644 function calls in 0.001 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.001    0.001 <string>:1(<module>)
        1    0.001    0.001    0.001    0.001 Less_4_Task_2c.py:3(simple_3)
        1    0.000    0.000    0.001    0.001 {built-in method builtins.exec}
      271    0.000    0.000    0.000    0.000 {built-in method builtins.len}
      270    0.000    0.000    0.000    0.000 {built-in method math.sqrt}
       99    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}


simple_2(1000)
100 loops, best of 5: 6.22 msec per loop
   8922 function calls in 0.015 seconds
   Ordered by: standard name
   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.015    0.015 <string>:1(<module>)
        1    0.013    0.013    0.015    0.015 Less_4_Task_2c.py:3(simple_3)
        1    0.000    0.000    0.015    0.015 {built-in method builtins.exec}
     3960    0.000    0.000    0.000    0.000 {built-in method builtins.len}
     3959    0.001    0.000    0.001    0.000 {built-in method math.sqrt}
      999    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
'''