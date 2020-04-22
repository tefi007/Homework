import requests
import json

api_key = 'TamEO8KdvnNnyG5JWfcGd8UFVUn3hII3Q704ybzv'
#link = 'https://api.nasa.gov/planetary/apod?api_key='  # на текущий день
link = 'https://api.nasa.gov/planetary/apod?hd=True&date=2020-01-05&api_key='

resp = requests.get(f'{link}{api_key}')
data = json.loads(resp.text)

print(data['hdurl'])

with open('data_nasa.json', 'w', encoding='utf-8') as f:
    data_json = json.dump(data,f)

'''
print(resp)
print(data)

for key in data.keys():
    print(key)
'''