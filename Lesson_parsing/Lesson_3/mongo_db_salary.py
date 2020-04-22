from pymongo import MongoClient
import pandas as pd
import pprint


client = MongoClient('localhost', 27017)
db = client['db_pars']
collection = db.prof

def salary (min_salary):
    print(f'Вакансии с указанной суммой заработной платы выше {min_salary}:')
    for i in db.prof.find( { '$or': [ {'salary_from': { '$gt': min_salary } }, { 'salary_to': { '$gt': min_salary } } ] }, {'_id': 0}):
        print(i)
    print()
    print('Вакансии с неуказанной суммой заработной платы (возможно среди них есть и то, что Вы ищите):')
    for i in db.prof.find( {'salary_to': None }, {'_id': 0}):
        print(i)

min_salary_1 = int(input('Введите минимальную сумму заработной платы:'))

salary(min_salary_1)
