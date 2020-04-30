from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from pymongo import MongoClient
import pprint
import time

options = Options()
options.add_argument('start-maximized')
driver = webdriver.Chrome(options=options)
driver.get('https://www.mvideo.ru/?cityId=CityCZ_975')
assert 'М.Видео' in driver.title

time.sleep(2)

button = driver.find_elements_by_class_name('sel-hits-button-next')
#button = driver.find_elements_by_xpath('//div[@class="gallery-layout sel-hits-block "]//div[@class="accessories-carousel-wrapper"]/a[@class="next-btn sel-hits-button-next"]')

n = 1

while True:
    #print(button)
    #print(len(button))
    y = 1
    for i in button:
        if y == 3:
            i.click()
        y += 1
    n += 1
    if n == 6:
        break
    time.sleep(3)

#sales_hit = driver.find_elements_by_xpath('//div[@class="gallery-layout sel-hits-block "]//div[contains(@class,"c-product-tile-picture__holder")]/a')
sales_hit = WebDriverWait(driver, 10).until(EC.presence_of_all_elements_located((By.XPATH, '//div[@class="gallery-layout sel-hits-block "]//div[contains(@class,"c-product-tile-picture__holder")]/a')))

m_video_products = {}
counter = 0
m = 0
for product in sales_hit:
    m_video_product = {}
    if (counter > 3) and (counter < 20):
        print(product.get_attribute('data-product-info'))
        print(product.get_attribute('href'))
        print('-' * 50)
        m_video_product['params'] = product.get_attribute('data-product-info')
        m_video_product['url'] = product.get_attribute('href')
        m_video_products[m] = m_video_product
        m += 1
    counter += 1

print('Ok')
#driver.quit()

print(m_video_products)

client = MongoClient('localhost', 27017)
db = client['db_m_video']
collection = db.hit

for i in range(0, len(m_video_products)):
    db.hit.insert_one(m_video_products[i])

#for f in db.hit.find({}):
#    print(f)



