import pandas as pd

my_df = pd.read_csv('hh_vacancy_pd_2.csv', header= 0, index_col= 0)
my_df_dict = my_df.to_dict()  # перевод в словарь словарей

#print(my_df)
#print(my_df_dict)

my_df_list = [*my_df_dict.values()]  # перевод в список из словаря

#print(my_df_list[:3])

