from pymongo import MongoClient
import pandas as pd
import pprint


client = MongoClient('localhost', 27017)
db = client['db_test']
collection = db.t_1

b = pd.read_csv("sj_vacancy_pd_2.csv")
print(b)

data = pd.DataFrame(list(collection.find()))
