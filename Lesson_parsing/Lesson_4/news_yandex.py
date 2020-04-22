from lxml import html
import requests
from pprint import pprint
import time
from pprint import pprint
import pandas as pd
from pymongo import MongoClient
import re
from datetime import datetime, date

header = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36'}
main_link = 'https://yandex.ru/news'
main_link_1 = 'https://yandex.ru'

response = requests.get(main_link, headers=header)
root = html.fromstring(response.text)                #Получаем DOM


link=[]
text=[]
source = []
news_date = []

items = root.xpath("//h2[@class='story__title']/a/@href")
items_t = root.xpath("//h2[@class='story__title']/a/text()")
items_s = root.xpath("//div[@class='story__date']/text()")
for item in items:
    link.append(f'{main_link_1}{item}')

for item_t in items_t:
    text.append(item_t)

for item_sd in items_s:
    a = date.today()
    b = re.findall('\d\d:\d\d', item_sd)
    for g in b:
        item_d = f'{a} {g}'
        news_date.append(item_d)
    h = re.split(' \d\d:\d\d', item_sd)
    source.append(h[0])

time.sleep(3)

#print(link)
#print(len(link))
#print(text)
#print(len(text))
#print(source)
#print(len(source))
#print(news_date)
#print(len(news_date))

news = {}
for d in range(0, len(link)):
    news_1 = {}
    news_1['name'] = text[d]
    news_1['link'] = link[d]
    news_1['source'] = source[d]
    news_1['news_date'] = news_date[d]
    news[d] = news_1

#pprint(news)

client = MongoClient('localhost', 27017)
db = client['db_pars_news']
collection = db.news

for i in range(0, len(news)):
    db.news.insert_one(news[i])

for f in db.news.find({}):
    print(f)
