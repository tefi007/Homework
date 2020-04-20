from bs4 import BeautifulSoup as BS

with open('index.htm', 'r', encoding='utf-8') as f:
    text_original = f.read()

soup = BS(text_original, 'html.parser')

print(soup.span.string)


