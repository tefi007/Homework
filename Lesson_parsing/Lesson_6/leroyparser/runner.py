from scrapy.crawler import CrawlerProcess
from scrapy.settings import Settings
from leroyparser import settings
from leroyparser.spiders.leroy_ru import LeroyRuSpider
if __name__ == '__main__':
    crawler_settings = Settings()
    crawler_settings.setmodule(settings)
    process = CrawlerProcess(settings=crawler_settings)
    process.crawl(LeroyRuSpider)
    process.start()

