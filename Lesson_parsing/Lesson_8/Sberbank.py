import pandas as pd
from datetime import datetime, date, time
from matplotlib import pyplot as plt

sber = pd.read_csv('opendata.csv')   # загрузка DatdFrame из csv файла (csv переведен в UTF-8 заранее)
print(sber.columns)                  # вывод названий столбцов
print(type(sber['date'][1]))         # вывод типа данных
print(type(sber['value'][1]))
print(sber.head(5))
sber['date'] = pd.to_datetime(sber['date'])  # изменение типа данных столбца date на datetime
#sber['date'] = sber['date'].dt.date          # изменение типа данных столбца date на date
print(type(sber['date'][1]))

#name_sber = input('Введите интересующий Вас показатель:')
#region_sber = input('Введите интересующий Вас ругион:')
#date_sber_from = input('Введите начало интересующего Вас периода: ')
#date_sber_to = input('Введите конец интересующего Вас периода: ')

name_sber = "Средняя зарплата"
region_sber = 'Ярославская область'
date_sber_from = '2016-01-01'
date_sber_to = '2017-12-31'
date_sber_from = datetime.strptime(date_sber_from, '%Y-%m-%d')
date_sber_to = datetime.strptime(date_sber_to, '%Y-%m-%d')

#print(sber.loc[(sber['name'] == name_sber)])

sber_1 = sber.loc[(sber['name'] == name_sber) & (sber['region'] == region_sber)]
sber_1 = sber_1.loc[(sber_1['date'] > date_sber_from) & (sber_1['date'] < date_sber_to)]

print(sber_1)

plt.plot(sber_1['date'], sber_1['value'], color='red')
plt.title(name_sber, fontsize=15, color='blue')
plt.xlabel('date range', fontsize=10, color='blue')
plt.ylabel('value', fontsize=10, color='blue')
plt.show()