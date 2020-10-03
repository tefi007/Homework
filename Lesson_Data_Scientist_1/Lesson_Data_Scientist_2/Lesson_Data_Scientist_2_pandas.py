import pandas as pd
import numpy as np

dict_1 = {'author_id': [1, 2, 3], 'author_name': ['Тургенев', 'Чехов', 'Островский']}
authors = pd.DataFrame(dict_1)
print(authors)
print()

dict_2 = {'author_id': [1, 1, 1, 2, 2, 3, 3], 'book_title': ['Отцы и дети', 'Рудин', 'Дворянское гнездо', 'Толстый и тонкий', 'Дама с собачкой', 'Гроза', 'Таланты и поклонники'], 'price': [450, 300, 350, 500, 450, 370, 290]}
books = pd.DataFrame(dict_2)
print(books)
print()

authors_price = pd.merge(authors, books, on='author_id', how='inner')
print(authors_price)
print()

top_5 = (authors_price.sort_values(by='price', ascending=False)).head(5)
print(top_5)
print()

authors_stat = authors_price.groupby('author_name').agg({'price':['min', 'max', 'mean']})
authors_stat = authors_stat.rename(columns={'min':'min_price', 'max':'max_price', 'mean':'mean_price'})
print(authors_stat)
print()

cover_1 = ['твердая', 'мягкая', 'мягкая', 'твердая', 'твердая', 'мягкая', 'мягкая']
authors_cover = authors_price
authors_cover.loc[authors_price["book_title"].notnull(), "cover"] = cover_1
print(authors_cover)
print()

book_info = pd.pivot_table(authors_price, values='price', index='author_name', columns='cover', aggfunc=np.sum)
print(book_info)
print()

book_info['мягкая'] = book_info['мягкая'].fillna(0)
book_info['твердая'] = book_info['твердая'].fillna(0)
print(book_info)
print()

book_info.to_pickle("book_info.pcl")
book_info2 = pd.read_pickle("book_info.pcl")
print(book_info2)