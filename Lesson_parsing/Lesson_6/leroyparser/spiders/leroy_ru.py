# -*- coding: utf-8 -*-
import scrapy
from scrapy.http import HtmlResponse
from leroyparser.items import LeroyparserItem
from scrapy.loader import ItemLoader


class LeroyRuSpider(scrapy.Spider):
    name = 'leroy_ru'
    allowed_domains = ['leroymerlin.ru']
    start_urls = ['https://leroymerlin.ru/catalogue/figury-sadovye']

    def parse(self, response:HtmlResponse):
        next_page = response.xpath("//div[@class='next-paginator-button-wrapper']/a/@href").extract_first()       # кнопка "дальше"
        ads_links = response.xpath("//div[@class='hover-image-buttons']/a/@href").extract()                       # urls страниц товаров
        for link in ads_links:
            yield response.follow(link, callback=self.parse_ads)
        yield response.follow(next_page, callback=self.parse)

    def parse_ads(self, response:HtmlResponse):
        loader = ItemLoader(item=LeroyparserItem(), response=response)
        loader.add_xpath('name',"//h1[@class='header-2']/text()")
        loader.add_xpath('price',"//span[@slot='price']/text()")
        loader.add_xpath('photos',"//uc-pdp-media-carousel[@slot='media-content']//picture/source[@media=' only screen and (min-width: 1024px)']/@srcset")
        loader.add_xpath('name_params',"//dt[@class='def-list__term']/text()")
        loader.add_xpath('value_params',"//dd[@class='def-list__definition']/text()")
        yield loader.load_item()

        #name = response.xpath("//h1[@class='header-2']/text()").extract_first()
        #photos = response.xpath("//uc-pdp-media-carousel[@slot='media-content']//img/@src").extract()
        #yield LeroyparserItem(name = name, photos = photos)