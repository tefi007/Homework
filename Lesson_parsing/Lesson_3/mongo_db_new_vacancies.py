from pymongo import MongoClient
import pandas as pd
import pprint


client = MongoClient('localhost', 27017)
db = client['db_pars']
collection = db.prof

def salary (vacancy):
    for j in vacancy:
        #print(vacancy[j]['link'])
        db.prof.update_one({'link': vacancy[j]['link']}, {'$set':vacancy[j]}, True)

vacancy_1 = {0:{'site': 'hh', 'name': 'Разработчик со знанием JavaScript (нейронные сети)', 'link': 'https://hh.ru/vacancy/35965090?query=data%20science%20or%20neural%20network%20or%20machine%20learning', 'salary_from': 250000, 'salary_to': None, 'salary_type': 'руб'}, 1:{'site': 'hh', 'name': 'Senior/middle Machine Learning Developer в команду продуктовой разработки', 'link': 'https://hh.ru/vacancy/36638102?query=data%20science%20or%20neural%20network%20or%20machine%20learning', 'salary_from': None, 'salary_to': 300000, 'salary_type': 'руб'}, 2:{'site': 'hh', 'name': 'Разработчик со знанием JavaScript (нейронные сети)', 'link': 'https://hh.ru/vacancy/35965090?query=data%20science%20or%20neural%20network%20or%20machine%20learning', 'salary_from': 777000, 'salary_to': 888000, 'salary_type': 'руб'}, 3:{'site': 'hh', 'name': 'Senior/middle Machine Learning Developer в команду продуктовой разработки', 'link': 'https://hh.ru/vacancy/36638102?query=data%20science%20or%20neural%20network%20or%20machine%20learning222', 'salary_from': 222000, 'salary_to': 333000, 'salary_type': 'руб'}}
salary(vacancy_1)