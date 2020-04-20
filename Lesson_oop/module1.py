
import re

with open('index_1.htm', 'r', encoding='utf-8') as f:
    text_original = f.read()

#print(text_original)

pattern = re.compile('<a class="home-link home-link_black_yes weather__grade" aria-label="+([\d]) °C, дождь" ')
print('Количество студентов GeekBrains: ', pattern.findall(text_original))

#'<div class="weather__temp">([\w]+)</div>'
#<span class="total-users">Нас уже ([\d ]+) человек</span>

#<a class="home-link home-link_black_yes weather__grade" aria-label="+6 °C, дождь" href="https://yandex.ru/pogoda/moscow" data-statlog="weather.grade" data-statlog-showed="1"><div class="weather__icon weather__icon_ovc_ra" title="дождь"></div><div class="weather__temp">+6°</div></a>