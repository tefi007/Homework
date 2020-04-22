import requests
import json

name = input('Введите имя пользователя:')
link = 'https://api.github.com/users/'

resp = requests.get(f'{link}{name}/repos')
data = json.loads(resp.text)

for i in data:
    for key, val in i.items():
        if key == 'name':
            print(val)

with open('data_github.json', 'w', encoding='utf-8') as f:
    data_json = json.dump(data,f)

