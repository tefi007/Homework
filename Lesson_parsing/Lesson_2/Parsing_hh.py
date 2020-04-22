from bs4 import BeautifulSoup as bs
import requests
import lxml
import re
from pprint import pprint
import pandas as pd
from pymongo import MongoClient

link = 'https://hh.ru/search/vacancy?L_is_autosearch=false&area=1&clusters=true&enable_snippets=true&text='
profession = 'data+science+or+neural+network+or+machine+learning'
link_prof = (f'{link}{profession}&page=0')

headers = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.149 Safari/537.36'}
response = requests.get(link_prof, headers=headers).text
soup = bs(response, 'lxml')

# число вакансий
number = soup.find('h1',{'class':'bloko-header-1'}).getText()
number = re.findall('\d+', number)
number = int(number[0])

hh_vacancy = []
hh_vacancy_1_pd = {}
hh_vacancy_2_pd = {}

for item in range (0, number):
    hh_vacancy_1 = ['hh']
    hh_vacancy_2 = {'site':'hh'}

    link_prof = (f'{link}{profession}&page={item//50}')

    response =  requests.get(link_prof, headers=headers).text
    soup = bs(response, 'lxml')



    link_main = soup.findAll('div',{'class':'vacancy-serp-item'})[item - (50 * (item//50))]        # блок вакансия
    link_name = link_main.find('a',{'class':'bloko-link HH-LinkModifier'})                   # блок из вакансии: название, ссылка
    link_salary = link_main.find('span', {'data-qa': 'vacancy-serp__vacancy-compensation'})  # блок зарплата

    name = link_name.getText()   # название профессии
    hh_vacancy_1.append(name)
    hh_vacancy_2['name'] = name
    href = link_name['href']     # ссылка на профессию
    hh_vacancy_1.append(href)
    hh_vacancy_2['link'] = href



    if link_salary == None:      # текст о зарплате
        salary_total = None
    else:
        salary_total = link_salary.getText()

    if salary_total == None:
        hh_vacancy_1.append(None)
        hh_vacancy_1.append(None)
        hh_vacancy_1.append(None)
        hh_vacancy_2['salary_from'] = None
        hh_vacancy_2['salary_to'] = None
        hh_vacancy_2['salary_type'] = None
    elif salary_total[0] == 'о':
        salary_type = re.split(' ', salary_total)[2]                 # значение валюты
        if '.' in salary_type[-1]:
            salary_type = salary_type[:-1]
        salary_from_1 = re.split(' ', salary_total)[1]
        salary_from_1 = re.split('\s', salary_from_1)

        salary_from = ''
        for i in range(0, len(salary_from_1)):
            salary_from = f'{salary_from}{salary_from_1[i]}'
        salary_from = int(salary_from)

        hh_vacancy_1.append(salary_from)
        hh_vacancy_1.append(None)
        hh_vacancy_1.append(salary_type)
        hh_vacancy_2['salary_from'] = salary_from
        hh_vacancy_2['salary_to'] = None
        hh_vacancy_2['salary_type'] = salary_type




    elif salary_total[0] == 'д':
        salary_type = re.split(' ', salary_total)[2]                 # значение валюты
        if '.' in salary_type[-1]:
            salary_type = salary_type[:-1]
        salary_to_1 = re.split(' ', salary_total)[1]
        salary_to_1 = re.split('\s', salary_to_1)

        salary_to = ''
        for i in range(0, len(salary_to_1)):
            salary_to = f'{salary_to}{salary_to_1[i]}'
        salary_to = int(salary_to)

        hh_vacancy_1.append(None)
        hh_vacancy_1.append(salary_to)
        hh_vacancy_1.append(salary_type)
        hh_vacancy_2['salary_from'] = None
        hh_vacancy_2['salary_to'] = salary_to
        hh_vacancy_2['salary_type'] = salary_type

    elif re.search('\d', salary_total[0]):
        salary_type = re.split(' ', salary_total)[1]                 # значение валюты
        if '.' in salary_type[-1]:
            salary_type = salary_type[:-1]

        salary_total_1 = re.split(' ', salary_total)[0]

        salary_from_1 = re.split('-', salary_total_1)[0]              # зарплата от
        salary_from_1 = re.split('\s', salary_from_1)
        salary_from = ''

        for i in range(0, len(salary_from_1)):
            salary_from = f'{salary_from}{salary_from_1[i]}'
        salary_from = int(salary_from)

        salary_to_1 = re.split('-', salary_total_1)[1]                # зарплата до
        salary_to_1 = re.split('\s', salary_to_1)
        salary_to = ''

        for i in range(0, len(salary_to_1)):
            salary_to = f'{salary_to}{salary_to_1[i]}'
        salary_to = int(salary_to)

        hh_vacancy_1.append(salary_from)                            # добавление данных о зарплате в список
        hh_vacancy_1.append(salary_to)
        hh_vacancy_1.append(salary_type)
        hh_vacancy_2['salary_from'] = salary_from
        hh_vacancy_2['salary_to'] = salary_to
        hh_vacancy_2['salary_type'] = salary_type

    else:
        hh_vacancy_1.append(None)
        hh_vacancy_1.append(None)
        hh_vacancy_1.append(None)
        hh_vacancy_2['salary_from'] = None
        hh_vacancy_2['salary_to'] = None
        hh_vacancy_2['salary_type'] = None

    hh_vacancy.append(hh_vacancy_1)
    hh_vacancy_1_pd[item] = hh_vacancy_1
    hh_vacancy_2_pd[item] = hh_vacancy_2

    if item == 1999:
        break

hh_vacancy_pd = pd.DataFrame((hh_vacancy_1_pd), index=['site', 'name', 'link', 'salary_from', 'salary_to', 'salary_type'])
hh_vacancy_pd_2 = pd.DataFrame(hh_vacancy_2_pd)

#print(hh_vacancy_pd)
#print(hh_vacancy_pd_2)
#print(hh_vacancy)
#print(hh_vacancy_2_pd)
#print()

#print(hh_vacancy_2_pd[1])

hh_vacancy_pd.to_csv('hh_vacancy_pd.csv')
hh_vacancy_pd_2.to_csv('hh_vacancy_pd_2.csv', index=True)

client = MongoClient('localhost', 27017)
db = client['db_pars']
collection = db.prof

for i in range(0, len(hh_vacancy_2_pd)):
    db.prof.insert_one(hh_vacancy_2_pd[i])

print(len(hh_vacancy_2_pd))