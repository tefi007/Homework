from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from pymongo import MongoClient
import time

#driver = webdriver.Chrome()
options = Options()
options.add_argument('start-maximized')
driver = webdriver.Chrome(options=options)
driver.get('https://e.mail.ru/inbox/?authid=k9jsld31.8d&back=1%2C1&dwhsplit=s3319.n1s&from=mail.login')
assert 'Авторизация' in driver.title

element = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CLASS_NAME, 'c0163')))
#element = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CLASS_NAME, 'c0163')))
#element = driver.find_element_by_class_name('c0163')
element.send_keys('study.ai_172@mail.ru', Keys.RETURN)

element = WebDriverWait(driver, 10).until(EC.element_to_be_clickable((By.CLASS_NAME, 'c0164')))
element.send_keys('NewPassword172',Keys.RETURN)

mail_ru_data = {}
coun = 0

test = ''
test_1 = ''
test_0 = 0

while True:

    mails = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CLASS_NAME, 'js-tooltip-direction_letter-bottom')))
    #mails = driver.find_element_by_class_name('js-tooltip-direction_letter-bottom')

    for cn in range(coun):
        mails = WebDriverWait(driver, 10).until(EC.presence_of_element_located((By.CLASS_NAME, 'js-tooltip-direction_letter-bottom')))
        time.sleep(1)
        mails.send_keys(Keys.ARROW_DOWN)
        time.sleep(1)
        mails.send_keys(Keys.END)
        time.sleep(1)

    #time.sleep(1)

    mails = WebDriverWait(driver, 10).until(EC.presence_of_all_elements_located((By.CLASS_NAME, 'js-tooltip-direction_letter-bottom')))
    print(len(mails))
    i = 0

    for mail in mails:
        mail_ru = {}
        print(mail.find_element_by_class_name('llc__item_date').text)      # дата письма
        print(mail.find_element_by_class_name('ll-crpt').text)             # автор письма
        print(mail.find_element_by_class_name('ll-sj__normal').text)       # тема письма
        print(mail.get_attribute('href'))                                  # ссылка на письмо
        print('--------------------------------------------------------------------------------')
        mail_ru['date'] = mail.find_element_by_class_name('llc__item_date').text
        mail_ru['autor'] = mail.find_element_by_class_name('ll-crpt').text
        mail_ru['topic'] = mail.find_element_by_class_name('ll-sj__normal').text
        mail_ru['url'] = mail.get_attribute('href')
        mail_ru['text'] = element
        mail_ru_data[i] = mail_ru
        test = mail.get_attribute('href')
        if i == 0 and test_1 == test:
            test_0 = 1
            break
        elif i == 0 and test_1 != test:
            test_1 = test
        i += 1

    if test_0 == 1:
        break

    print(mail_ru_data)
    print('___________________________________________________________________________')

    for j in mail_ru_data:
        driver.get(mail_ru_data[j]['url'])
        assert 'Mail.ru' in driver.title

        time.sleep(3)

        element_1 = driver.find_element_by_class_name('js-readmsg-msg').text
        mail_ru_data[j]['text'] = element_1

        #if j == 2:
        #    break

    driver.get('https://e.mail.ru/inbox/')

    time.sleep(3)
    coun += 1

print(mail_ru_data)

print('Ok')

driver.quit()

'''
client = MongoClient('localhost', 27017)
db = client['db_mail_ru_mails']
collection = db.mails

for i in range(0, len(mail_ru_data)):
    db.mails.insert_one(mail_ru_data[i])

#for f in db.mails.find({}):
#    print(f)
'''