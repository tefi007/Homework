from lxml import html
import requests
from pprint import pprint
import time
from pprint import pprint
import pandas as pd
from pymongo import MongoClient

header = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36'}
main_link = 'https://news.mail.ru'

# парсим все новостные ссылки в блоке: политика, эконимика, общество, события
# в браузере в chropath копируем полные пути до нужных ссылок, анализируем, и через цикл проходимся по всем ссылкам

response = requests.get(main_link, headers=header)
root = html.fromstring(response.text)                #Получаем DOM

a = 0
link = []
text = []
source = []
date = []
while True:
    a += 1
    items = root.xpath(f"/html[1]/body[1]/div[9]/div[2]/div[3]/div[1]/div[1]/div[1]/div[{a}]/div[1]/div[2]/span[2]/a[1]/@href")
    items_t = root.xpath(f"/html[1]/body[1]/div[9]/div[2]/div[3]/div[1]/div[1]/div[1]/div[{a}]/div[1]/div[2]/span[2]/a[1]/span[1]/text()")
    if len(items) == 0:
        break
    for item in items:
        link.append(f'{main_link}{item}')
        for item_t in items_t:
            text.append(item_t)
        response_s = requests.get(f'{main_link}{item}', headers=header)
        root_s = html.fromstring(response_s.text)                #Получаем DOM
        items_s = root_s.xpath('/html[1]/body[1]/div[9]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[2]/span[1]/a[1]/span[1]/text()')
        if len(items_s) == 0:
            items_s = root_s.xpath('/html[1]/body[1]/div[8]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[2]/span[1]/a[1]/span[1]/text()')
        for item_s in items_s:
            source.append(item_s)

        items_time = root_s.xpath('/html[1]/body[1]/div[9]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[1]/span[1]/span[1]/@datetime')
        if len(items_time) == 0:
            items_time = root_s.xpath('/html[1]/body[1]/div[8]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[1]/span[1]/span[1]/@datetime')
        for item_time in items_time:
            date.append(item_time)

    time.sleep(3)

b = 0
c = 0
while True:
    b += 1
    c += 1
    items = root.xpath(f"/html[1]/body[1]/div[9]/div[2]/div[3]/div[1]/div[1]/div[1]/div[{b}]/div[1]/ul[1]/li[{c}]/span[1]/a[1]/@href")
    items_t = root.xpath(f"/html[1]/body[1]/div[9]/div[2]/div[3]/div[1]/div[1]/div[1]/div[{b}]/div[1]/ul[1]/li[{c}]/span[1]/a[1]/span[1]/text()")
    if len(items) == 0:
        break
    for item in items:
        link.append(f'{main_link}{item}')

        for item_t in items_t:
            text.append(item_t)

        response_s = requests.get(f'{main_link}{item}', headers=header)
        root_s = html.fromstring(response_s.text)                #Получаем DOM
        items_s = root_s.xpath('/html[1]/body[1]/div[9]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[2]/span[1]/a[1]/span[1]/text()')
        if len(items_s) == 0:
            items_s = root_s.xpath('/html[1]/body[1]/div[8]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[2]/span[1]/a[1]/span[1]/text()')
        for item_s in items_s:
            source.append(item_s)

        items_time = root_s.xpath('/html[1]/body[1]/div[9]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[1]/span[1]/span[1]/@datetime')
        if len(items_time) == 0:
            items_time = root_s.xpath('/html[1]/body[1]/div[8]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[1]/span[1]/span[1]/@datetime')
        for item_time in items_time:
            date.append(item_time)

        c += 1
        while True:
            items_1 = root.xpath(f"/html[1]/body[1]/div[9]/div[2]/div[3]/div[1]/div[1]/div[1]/div[{b}]/div[1]/ul[1]/li[{c}]/span[1]/a[1]/@href")
            items_t = root.xpath(f"/html[1]/body[1]/div[9]/div[2]/div[3]/div[1]/div[1]/div[1]/div[{b}]/div[1]/ul[1]/li[{c}]/span[1]/a[1]/span[1]/text()")
            if len(items_1) == 0:
                c = 0
                break
            for item_1 in items_1:
                link.append(f'{main_link}{item_1}')
                for item_t in items_t:
                    text.append(item_t)

                response_s = requests.get(f'{main_link}{item_1}', headers=header)
                root_s = html.fromstring(response_s.text)                #Получаем DOM
                items_s = root_s.xpath('/html[1]/body[1]/div[9]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[2]/span[1]/a[1]/span[1]/text()')
                if len(items_s) == 0:
                    items_s = root_s.xpath('/html[1]/body[1]/div[8]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[2]/span[1]/a[1]/span[1]/text()')
                for item_s in items_s:
                    source.append(item_s)

                items_time = root_s.xpath('/html[1]/body[1]/div[9]/div[2]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[1]/span[1]/span[1]/@datetime')
                if len(items_time) == 0:
                    items_time = root_s.xpath('/html[1]/body[1]/div[8]/div[1]/div[1]/div[1]/div[1]/div[1]/div[2]/div[1]/div[1]/div[1]/span[1]/span[1]/span[1]/@datetime')
                for item_time in items_time:
                    date.append(item_time)

                c += 1
            time.sleep(3)


#print(link)
#print(len(link))
#print(text)
#print(len(text))
#print(source)
#print(len(source))
#print(date)
#print(len(date))

news = {}
for d in range(0, len(link)):
    news_1 = {}
    news_1['name'] = text[d]
    news_1['link'] = link[d]
    news_1['source'] = source[d]
    news_1['news_date'] = date[d]
    news[d] = news_1

#pprint(news)

client = MongoClient('localhost', 27017)
db = client['db_pars_news']
collection = db.news

for i in range(0, len(news)):
    db.news.insert_one(news[i])

for f in db.news.find({}):
    print(f)