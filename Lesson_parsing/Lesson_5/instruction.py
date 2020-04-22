
# pip3 install scrapy                                                       # терминал - установка scrapy
# scrapy startproject jobparser D:\Tefi\Домашка\Lesson_parsing\Lesson_5     # терминал - создание проекта scrapy <название проекта> <адрес проекта>
# scrapy genspider hh_ru  hh.ru                                             # терминал - создание в папке spiders самого паука <имя паука> <стартовый поисковый домен паука>
# убеждаемся что наш паук hh_ru создался именно в папке spiders

# переходим в файл settings раскомментируем и настраиваем:
    # USER_AGENT chrome://version
    # ROBOTSTXT_OBEY False    индексация некоторых сайлов
    # LOG_ENABLED = True    дописать - выводить логи
    # LOG_LEVEL = 'DEBUG'     дописать - ограничиться логами об ошибках 'ERROR' - об ошибках 'INFO' - о работе 'DEBUG' - инфо и ошибки
    # CONCURRENT_REQUESTS = 32   конкурирующие запросы, кол-во одновременных потоков (16)
    # DOWNLOAD_DELAY = 3    задержка в сек между пачками конкурирующих запросов
    # CONCURRENT_REQUESTS_PER_DOMAIN = 16  ограничение кол-ва запросов на 1 домен за 1 раз
    # CONCURRENT_REQUESTS_PER_IP = 16   ограничение кол-ва запросов на 1 IP за 1 раз

# создаем файл runner.py внутри нашего проекта jobparser  - файл для запуска пауков из питона, а не терминала
    # необходимые настройки описаны внутри файла

# переходим в файл паука hh_ru
    # задаем стартовую url, в этот список можно поместить несколько url для ускорения (но логика может оказаться сложнее):
        # start_urls = ['https://hh.ru/search/vacancy?clusters=true&area=1&search_field=name&enable_snippets=true&salary=&st=searchVacancy&text=Programmer']
        # так же start_urls можно прописать функцией, которая будет подставлять разные вакансии из параметра переданного в runnere
    # при запуске паука идет автоматический get запрос на start_urls --> ответ сбрасывается в  RESPONSE --> def parse(self, response)

    # в функции parse сначала необходимо описать логику перехода по страницам (parse получает пока только одны страницу) - по кнопке 'дальше'
    # дописываем необходимые нам import
    # пишем к какому типу классов относится переменная response - HtmlResponse (необязательно)
    # создаем next_page в к-рой описываем через xpath или css прописываем путь и выделяем нужный элемент на странице (описываем кнопку "дальше") - ссылки м.б. относительные scrapy их сама достраивает
    # вызываем yield response.follow(next_page, callback=self.parse)
        # запомнить где остановились, сбросить response этой ф-ции дальше, повторно вызвать self.parse (эту же ф-цию)? но в response положить новую ссылку - next_page
    # ф-ция parse собирает инфо со страницы с списком вакансий и переходит на следующую страницу, пока страницы не закончатся - тогда None и follow уже ничего не передает
    # vacancy_links = response.xpath()  - response -это url стр со списком вакансий, прописываем путь для извлечения всех url самих вакансий


from pymongo import MongoClient
import pprint

client = MongoClient('localhost', 27017)
#db = client['db_scraby_pars']
#collection = db.hh_ru

db = client['db_scraby_pars']
collection = db.sj_ru

#for i in client.list_databases():  # список БД
#    print(i)


#db.sj_ru.delete_many({})   # очистка БД

#for i in db.sj_ru.find({}):
#    print(i)


#db.hh_ru.delete_many({})   # очистка БД

for i in db.hh_ru.find({}):
    print(i)

