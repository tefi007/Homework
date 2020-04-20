from bs4 import BeautifulSoup as BS
from requests import get

def get_link(topic):                                                 #ссылка на основной сайт
    link = 'https://ru.wikipedia.org/wiki/' + topic.capitalize()
    return link

def get_topic_page(topic):                                           #страница основной ссылки
    link = get_link(topic)
    html_content = get(link).text
    return html_content

def get_sitelinks(topic):                                            #список ссылок с соседних страниц + основная ссылка
    html_content = get_topic_page(topic)
    soup = BS(html_content, 'html.parser')
    soup_1 = soup.find_all('a')
    sitelinks = []
    for n in soup_1:
        if '/wiki' and 'https' in n.get('href',''):
            sitelinks.append(n.get('href',''))
        else:
            continue
    html_content = get_link(topic)
    sitelinks.append(html_content)
    return sitelinks

def get_topic_pages(topic):                                           #страницы основной ссылки и дополнительных ссылок в одной строке
    links = get_sitelinks(topic)
    html_contents = ''
    for i in links:
        html_contents = html_contents + get(i).text
    return html_contents

#result = get_sitelinks('Квакша')
#print (result)