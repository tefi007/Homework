import math
import itertools
from decimal import Decimal
import decimal

#decimal.getcontext().prec=12

lim = Decimal(0.0000001)
factorial = 0
calc_i = 0

for i in itertools.count(2, 1):
    i = Decimal(i)
    if factorial == 0:
        factorial = math.factorial(i)
    else:
        factorial = factorial * i

    if calc_i == 0:
        calc_i = i / (factorial ** 1/i)
        calc_i1 = (i+1) / ((factorial * (i + 1)) ** (1/(i+1)))
    else:
        calc_i1 = (i+1) / ((factorial * (i + 1)) ** (1/(i+1)))

    if abs(calc_i1 - calc_i) > lim:
        print(i, calc_i, abs(calc_i1 - calc_i))
    else:
        print(f'Предел достигнут: n = {i}, значение = {calc_i}')
        break

    calc_i = calc_i1