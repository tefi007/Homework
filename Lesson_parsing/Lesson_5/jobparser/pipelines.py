# -*- coding: utf-8 -*-

# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://docs.scrapy.org/en/latest/topics/item-pipeline.html
from pymongo import MongoClient
import re

class JobparserPipeline(object):
    def __init__(self):
        client = MongoClient('localhost', 27017)
        self.mongo_base = client.db_scraby_pars

    def process_item(self, item, spider):

        atom = {}
        atom[1] = item

        atom[1]['url'] = atom[1]['url'][5:-1]


        if spider.name == 'sj_ru':
            if atom[1]['salary'][0] == 'По договорённости':
                atom[1]['salary_from'] = None
                atom[1]['salary_to'] = None
                atom[1]['salary_type'] = None
                del atom[1]['salary']
            elif atom[1]['salary'][0] == 'от':
                a = atom[1]['salary'][2].split('\xa0')
                b = a[-1]
                a = a[:-1]
                atom[1]['salary_from'] = ''.join(a)
                atom[1]['salary_to'] = None
                atom[1]['salary_type'] = b
                del atom[1]['salary']
            elif atom[1]['salary'][0] == 'до':
                a = atom[1]['salary'][2].split('\xa0')
                b = a[-1]
                a = a[:-1]
                atom[1]['salary_from'] = None
                atom[1]['salary_to'] = ''.join(a)
                atom[1]['salary_type'] = b
                del atom[1]['salary']
            elif re.findall('\d',atom[1]['salary'][0][0]):
                a_1 = atom[1]['salary'][0].split('\xa0')
                a_2 = atom[1]['salary'][1].split('\xa0')
                b = atom[1]['salary'][3]
                atom[1]['salary_from'] = ''.join(a_1)
                atom[1]['salary_to'] = ''.join(a_2)
                atom[1]['salary_type'] = b
                del atom[1]['salary']
        elif spider.name == 'hh_ru':
            if atom[1]['salary'][0] == 'от ' and atom[1]['salary'][2] != ' до ':
                a = atom[1]['salary'][1].split('\xa0')
                atom[1]['salary_from'] = ''.join(a)
                atom[1]['salary_to'] = None
                atom[1]['salary_type'] = atom[1]['salary'][3]
                del atom[1]['salary']

            elif atom[1]['salary'][0] == 'от ' and atom[1]['salary'][2] == ' до ':
                a = atom[1]['salary'][1].split('\xa0')
                b = atom[1]['salary'][3].split('\xa0')
                atom[1]['salary_from'] = ''.join(a)
                atom[1]['salary_to'] = ''.join(b)
                atom[1]['salary_type'] = atom[1]['salary'][5]
                del atom[1]['salary']

            elif atom[1]['salary'][0] == ' з/п не указана' or atom[1]['salary'][0] == 'з/п не указана':
                atom[1]['salary_from'] = None
                atom[1]['salary_to'] = None
                atom[1]['salary_type'] = None
                del atom[1]['salary']

            elif atom[1]['salary'][0] == 'до ':
                b = atom[1]['salary'][1].split('\xa0')
                atom[1]['salary_from'] = None
                atom[1]['salary_to'] = ''.join(b)
                atom[1]['salary_type'] = atom[1]['salary'][3]
                del atom[1]['salary']

        atom[1]['site'] = spider.name

        collection = self.mongo_base[spider.name]
        collection.insert_one(item)
        return item

