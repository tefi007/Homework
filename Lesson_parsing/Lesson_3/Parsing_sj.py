from bs4 import BeautifulSoup as bs
import requests
import lxml
import re
from pprint import pprint
import pandas as pd
from pymongo import MongoClient

link = 'https://www.superjob.ru/vakansii/programmist.html?geo%5Bt%5D%5B0%5D=4&page='
link_1 = 'https://www.superjob.ru'

'''
link_page = f'{link}0'
response = requests.get(link_page).text
soup = bs(response, 'lxml')
page_max = soup.findAll('span', {'class': '_3IDf-'})
print(page_max)
'''


sj_vacancy = []
sj_vacancy_1_pd = {}
sj_vacancy_2_pd = {}

page = 0
number = 0

while True:
    sj_vacancy_1 = ['sj']
    sj_vacancy_2 = {'site':'hh'}

    page = number // 20 + 1
    link_prof = (f'{link}{page}')
    response = requests.get(link_prof).text
    soup = bs(response, 'lxml')

    link_page = soup.findAll('div', {'class': '_3mfro PlM3e _2JVkc _2VHxz _3LJqf'})
    if link_page != []:
        break

    link_main = soup.findAll('div',{'class':'_3zucV f-test-vacancy-item _3j3cA RwN9e _3tNK- _1NStQ _1I1pc'})
    con = len(link_main)

    if con < 20:
        if con == number - (20 * (page - 1)):
            break

    link_main = soup.findAll('div',{'class':'_3zucV f-test-vacancy-item _3j3cA RwN9e _3tNK- _1NStQ _1I1pc'})[number - (20 * (number//20))]   # блок вакансия

    link_name = link_main.findAll('a', {'class': 'icMQ_'})[0]    # блок название, ссылка

    link_href = link_name['href']
    href = f'{link_1}{link_href}'    # ссылка
    name = link_name.getText()       # название профессии

    sj_vacancy_1.append(name)
    sj_vacancy_2['name'] = name
    sj_vacancy_1.append(href)
    sj_vacancy_2['link'] = href

    link_salary = link_main.find('span', {'class': '_3mfro _2Wp8I _31tpt f-test-text-company-item-salary PlM3e _2JVkc _2VHxz'})
    link_salary = link_salary.getText()

    if link_salary == 'По договорённости':
        sj_vacancy_1.append(None)
        sj_vacancy_1.append(None)
        sj_vacancy_1.append(None)
        sj_vacancy_2['salary_from'] = None
        sj_vacancy_2['salary_to'] = None
        sj_vacancy_2['salary_type'] = None


    elif re.search('\d', link_salary[0]):
        salary_type_1 = re.split('\s', link_salary)[-1]                 # значение валюты
        if '.' in salary_type_1[-1]:
            salary_type = salary_type_1[:-1]

        salary_type_2 = re.split('\s', link_salary)[:-1]

        if '—' in salary_type_2:
            salary_from = ''
            salary_to = ''
            to = False
            n=0
            for i in salary_type_2:
                if to == True:
                    salary_to = f'{salary_to}{salary_type_2[n]}'
                if i != '—' and to != True:
                    salary_from = f'{salary_from}{salary_type_2[n]}'
                else:
                    to = True
                n += 1
            salary_from = int(salary_from)
            salary_to = int(salary_to)
        else:
            salary_from = ''
            for i in range(0, len(salary_type_2)):
                salary_from = f'{salary_from}{salary_type_2[i]}'

            salary_from = int(salary_from)
            salary_to = salary_from

        sj_vacancy_1.append(salary_from)
        sj_vacancy_1.append(salary_to)
        sj_vacancy_1.append(salary_type)
        sj_vacancy_2['salary_from'] = salary_from
        sj_vacancy_2['salary_to'] = salary_to
        sj_vacancy_2['salary_type'] = salary_type

    elif link_salary[0] == 'о':

        salary_type_1 = re.split('\s', link_salary)[-1]                 # значение валюты
        if '.' in salary_type_1[-1]:
            salary_type = salary_type_1[:-1]

        salary_type_2 = re.split('\s', link_salary)[1:-1]

        salary_from = ''
        n = 0
        for i in salary_type_2:
            salary_from = f'{salary_from}{salary_type_2[n]}'
            n += 1
        salary_from = int(salary_from)

        sj_vacancy_1.append(salary_from)
        sj_vacancy_1.append(None)
        sj_vacancy_1.append(salary_type)
        sj_vacancy_2['salary_from'] = salary_from
        sj_vacancy_2['salary_to'] = None
        sj_vacancy_2['salary_type'] = salary_type

    elif link_salary[0] == 'д':

        salary_type_1 = re.split('\s', link_salary)[-1]                 # значение валюты
        if '.' in salary_type_1[-1]:
            salary_type = salary_type_1[:-1]

        salary_type_2 = re.split('\s', link_salary)[1:-1]

        salary_to = ''
        n = 0
        for i in salary_type_2:
            salary_to = f'{salary_to}{salary_type_2[n]}'
            n += 1
        salary_to = int(salary_to)

        sj_vacancy_1.append(None)
        sj_vacancy_1.append(salary_to)
        sj_vacancy_1.append(salary_type)
        sj_vacancy_2['salary_from'] = None
        sj_vacancy_2['salary_to'] = salary_to
        sj_vacancy_2['salary_type'] = salary_type

    else:
        sj_vacancy_1.append(None)
        sj_vacancy_1.append(None)
        sj_vacancy_1.append(None)
        sj_vacancy_2['salary_from'] = None
        sj_vacancy_2['salary_to'] = None
        sj_vacancy_2['salary_type'] = None

    sj_vacancy.append(sj_vacancy_1)
    sj_vacancy_1_pd[number] = sj_vacancy_1
    sj_vacancy_2_pd[number] = sj_vacancy_2

    number += 1


sj_vacancy_pd = pd.DataFrame((sj_vacancy_1_pd), index=['site', 'name', 'link', 'salary_from', 'salary_to', 'salary_type'])
sj_vacancy_pd_2 = pd.DataFrame(sj_vacancy_2_pd)

#pprint(sj_vacancy_pd)
#pprint(sj_vacancy)

sj_vacancy_pd.to_csv('sj_vacancy_pd.csv')
sj_vacancy_pd_2.to_csv('sj_vacancy_pd_2.csv', index=True)

client = MongoClient('localhost', 27017)
db = client['db_pars']
collection = db.prof

for i in range(0, len(sj_vacancy_2_pd)):
    db.prof.insert_one(sj_vacancy_2_pd[i])

print(len(sj_vacancy_2_pd))
