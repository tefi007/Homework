from scrapy.crawler import CrawlerProcess
from scrapy.settings import Settings
from jobparser import settings                            # настройки из нашего проекта
#from jobparser import settings2
from jobparser.spiders.hh_ru import HhRuSpider            # импорт класса нужного паука
from jobparser.spiders.sj_ru import SjRuSpider
if __name__ == '__main__':                                # выполнять только, если этот файл запущен
    crawler_settings = Settings()                         # создаем экземпляр настроек (класс Settings)
    crawler_settings.setmodule(settings)                  # присваиваем экземпляру настроек наши настройки
    process = CrawlerProcess(settings=crawler_settings)   # создаем экземпляр процесса и присваиваем ему наши настройки
    process.crawl(HhRuSpider, text='Programmer')          # этот процесс соответствует такому-то пауку --> происходим передача этих данных в класс HhRuSpider файла hh_ru
    process.crawl(SjRuSpider, text='programmist')                # в параметре text (имя м.б. любым) лежит нужная вакансия, к-рая в start_urls в hh_ru м.б. вписана функцией
    process.start()                                       # запуск процесса --> запуск привязанного к нему паука