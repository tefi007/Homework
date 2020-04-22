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
main_link = 'https://lenta.ru'

response = requests.get(main_link, headers=header)
root = html.fromstring(response.text)                #Получаем DOM

news_link=[]
news_text=[]
news_source = []
news_date = []

#items_link = root.xpath("//div[@class='titles']//a/@href")
items_link = root.xpath("//div[@class='item']/a/@href | //div[@class='first-item']/a/@href | //div[@class='titles']//a/@href")

for item_link in items_link:
    if 'http' in item_link:
        pass
    elif ('extlink' in item_link) or ('brief' in item_link):
        pass
    else:
        news_link.append(f'{main_link}{item_link}')
        news_source.append('lenta.ru')

        response_d = requests.get(f'{main_link}{item_link}', headers=header)
        root_d = html.fromstring(response_d.text)                #Получаем DOM

        items_date = root_d.xpath("//time[@class='g-date']/@datetime")
        for item_date in items_date:
            news_date.append(item_date)

        items_text = root_d.xpath("//h1[@class='b-topic__title']/text()")
        for item_text in items_text:
            item_text = re.sub('\s', ' ', item_text)
            news_text.append(item_text)


#pprint(news_link)
#print(len(news_link))
#pprint(news_text)
#print(len(news_text))
#pprint(news_source)
#print(len(news_source))
#pprint(news_date)
#print(len(news_date))

news = {}
for d in range(0, len(news_link)):
    news_1 = {}
    news_1['name'] = news_text[d]
    news_1['link'] = news_link[d]
    news_1['source'] = news_source[d]
    news_1['news_date'] = news_date[d]
    news[d] = news_1

pprint(news)

client = MongoClient('localhost', 27017)
db = client['db_pars_news']
collection = db.news

for i in range(0, len(news)):
    db.news.insert_one(news[i])

for f in db.news.find({}):
    print(f)