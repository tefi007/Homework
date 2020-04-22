# -*- coding: utf-8 -*-
import scrapy
from scrapy.http import HtmlResponse
from jobparser.items import JobparserItem


class SjRuSpider(scrapy.Spider):
    name = 'sj_ru'
    allowed_domains = ['superjob.ru']
    start_urls = ['https://www.superjob.ru/vakansii/programmist.html?geo%5Bt%5D%5B0%5D=4']

    def parse(self, response:HtmlResponse):             # метод pars, пишем к какому типу классов относится переменная response (необязательно)
        next_page = response.xpath("//a[@class='icMQ_ _1_Cht _3ze9n f-test-button-dalshe f-test-link-Dalshe']/@href").extract_first()
        #next_page = response.css("a.icMQ_ _1_Cht _3ze9n f-test-button-dalshe f-test-link-Dalshe::attr(href)").extract_first()      # прописываем путь и выделяем нужный элемент на странице (описываем кнопку "дальше")
        yield response.follow(next_page, callback=self.parse)   # запомнить где остановились, сбросить response этой ф-ции дальше, повторно вызвать self.parse (эту же ф-цию)
                                                                # но в response положить новую ссылку - next_page
        vacancy_links = response.xpath("//div[@class='_3mfro CuJz5 PlM3e _2JVkc _3LJqf']/a/@href").extract()  # response -это url стр со списком вакансий, прописываем путь для извлечения
        for link in vacancy_links:                                                                # всех url самих вакансий
            yield response.follow(link, callback=self.vacancy_parce)

    def vacancy_parce(self, response:HtmlResponse):
        name1 = response.xpath("//h1[@class='_3mfro rFbjy s1nFK _2JVkc']/text()").extract_first()
        salary1 = response.xpath("//span[@class='_3mfro _2Wp8I ZON4b PlM3e _2JVkc']/text()").extract()
        print(name1)
        print(salary1)
        link_1 = f'{response}'
        yield JobparserItem(name=name1, salary=salary1, url=link_1)
