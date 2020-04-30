from lxml import html
import requests
from pprint import pprint

header = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.163 Safari/537.36'}
main_link = 'https://e.mail.ru/inbox/?authid=k9juvyte.vuc&back=1%2C1&dwhsplit=s3319.n0s&from=login'

response = requests.get(main_link, headers=header)
root = html.fromstring(response.text)                #Получаем DOM

item = root.xpath('//a[@class="llc js-tooltip-direction_letter-bottom js-letter-list-item llc_normal"]')
print(item)
print(type(item))

for i in item:
    print(i)