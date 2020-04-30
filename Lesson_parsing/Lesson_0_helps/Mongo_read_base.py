from pymongo import MongoClient
import pprint

client = MongoClient('localhost', 27017)
db = client['db_scraby_pars']
collection = db.hh_ru

#for i in client.list_databases():  # список БД
#    print(i)

#db.hh_ru.delete_many({})   # очистка БД

for i in db.hh_ru.find({}):
    print(i)