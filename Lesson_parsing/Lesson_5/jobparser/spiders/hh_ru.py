# -*- coding: utf-8 -*-
import scrapy
from scrapy.http import HtmlResponse
from jobparser.items import JobparserItem


class HhRuSpider(scrapy.Spider):              # класс spider
    name = 'hh_ru'                            # имя паука
    allowed_domains = ['hh.ru']               #
    start_urls = ['https://hh.ru/search/vacancy?clusters=true&area=1&search_field=name&enable_snippets=true&salary=&st=searchVacancy&text=Programmer']       # стартовая url
#    def __init__(self, text):
#        self.start_urls = [f'https://izhevsk.hh.ru/search/vacancy?L_save_area=true&clusters=true&enable_snippets=true&text={text}&showClusters=false']

    def parse(self, response:HtmlResponse):             # метод pars, пишем к какому типу классов относится переменная response (необязательно)
        #next_page = response.xpath("//a[@class='bloko-button HH-Pager-Controls-Next HH-Pager-Control']")
        next_page = response.css("a.HH-Pager-Controls-Next::attr(href)").extract_first()      # прописываем путь и выделяем нужный элемент на странице (описываем кнопку "дальше")
        yield response.follow(next_page, callback=self.parse)   # запомнить где остановились, сбросить response этой ф-ции дальше, повторно вызвать self.parse (эту же ф-цию)
                                                                # но в response положить новую ссылку - next_page

        vacancy_links = response.xpath("//a[@class='bloko-link HH-LinkModifier']/@href").extract()  # response -это url стр со списком вакансий, прописываем путь для извлечения
        for link in vacancy_links:                                                                  # всех url самих вакансий
            yield response.follow(link, callback=self.vacancy_parce)

    def vacancy_parce(self, response:HtmlResponse):
        name1 = response.css("div.vacancy-title h1::text").extract_first()
        salary1 = response.xpath("//span[@class='bloko-header-2 bloko-header-2_lite']/text()").extract()
        print(name1)
        link_1 = f'{response}'
        yield JobparserItem(name=name1, salary=salary1, url=link_1)
