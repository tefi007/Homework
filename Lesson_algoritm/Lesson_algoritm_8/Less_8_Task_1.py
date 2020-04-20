# На улице встретились N друзей. Каждый пожал руку всем остальным друзьям (по одному разу). Сколько рукопожатий было?
# Примечание. Решите задачу при помощи построения графа.

n = int(input('Введите число друзей: '))

graf = [[1 for j in range(n)] for i in range(n)]
for i in range(n):
    graf[i][i] = 0
print(*graf, sep='\n')

graf_sum = 0

for i in graf:
    graf_sum += sum(i)

print(f'Всего рукопожатий: {graf_sum}')