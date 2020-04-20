# Пользователь вводит данные о количестве предприятий, их наименования и прибыль за четыре квартала для каждого предприятия.
# Программа должна определить среднюю прибыль (за год для всех предприятий) и отдельно вывести наименования предприятий, чья прибыль выше среднего и ниже среднего.

import collections

n = int(input('Введите количество приедприятий: '))
company = collections.Counter()
more = []
less = []

for i in range(n):
    name_com = input(f'Введите название {i+1} предприятия: ')
    company[name_com] = float(input('Введите прибыль предприятия за 4 квартала: '))

company_average = sum(company.values()) / n

for k, v in company.items():
    if v >= company_average:
        more.append(k)
    else:
        less.append(k)

print(f'Средняя прибыль предприятий за год: {company_average}')
print(f'Предприятия с прибылью больше или равной средней прибыли за год: {more}')
print(f'Предприятия с прибылью меньше средней прибыли за год: {less}')