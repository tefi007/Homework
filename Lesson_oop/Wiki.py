import re
from requests import get
from wiki_request import get_link, get_topic_page, get_sitelinks, get_topic_pages

def get_topic_words(topic):                                         #список слов основной страницы и ссылочных страниц
    html_content = get_topic_pages(topic)
    words = re.findall('[а-яА-Я\-\']{3,}', html_content)
    #text = ' '.join(words)
    #return text
    return words

def get_common_words(topic):                                         #список кортежей частоты употребляемости слов основной и ссылочных страниц
    words_list = get_topic_words(topic)
    #print (get_topic_words_add (topic))
    #words_list.append(get_topic_words_add (topic))
    rate = {}
    for word in words_list:
        if word in rate:
            rate[word] += 1
        else:
            rate[word] = 1
    rate_list = list(rate.items())
    rate_list.sort(key = lambda x:-x[1])
    return rate_list

def visualize_common_words(topic):                                   #20 самых часто употребленных слов на основной странице и ссылочных страниц
    words = get_common_words(topic)
    for w in words[0:20]:
        print (w[0])
    #print ('Top 20: ', words[0:20])

def main():
    topic = input('Topic: ')
    visualize_common_words (topic)


main()
