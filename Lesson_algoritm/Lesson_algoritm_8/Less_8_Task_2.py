# Доработать алгоритм Дейкстры (рассматривался на уроке), чтобы он дополнительно возвращал список вершин, которые необходимо обойти.



def dijkstra (graf, start):
    length = len(graf)
    is_visited = [False] * length
    cost = [float('inf')] * length
    parent = [-1] * length
    cost[start] = 0
    min_cost = 0

    start_1 = start

    while min_cost < float('inf'):
        is_visited[start] = True

        for i, vertex in enumerate (graf[start]):
            if vertex != 0 and not is_visited[i]:
                if cost[i] > vertex + cost[start]:
                    cost[i] = vertex + cost[start]
                    parent[i] = start

        min_cost = float('inf')
        for i in range(length):
            if min_cost > cost[i] and not is_visited[i]:
                min_cost = cost[i]
                start = i

    path = {}
    for i in range(length):
        if cost[i] == float('inf'):
            path[i] = 'нет пути'
        elif parent[i] == -1:
            path[i] = i
        else:
            temp = []
            i_1 = i
            temp.append(i_1)

            while True:
                if i_1 == start_1:
                    break
                temp.append(parent[i_1])
                i_1 = parent[i_1]
            temp.reverse()
            path[i] = temp

    print(cost)
    print()
    print('Пути до вершин:')
    for i in path.items():
        print(i)
    print()
    return cost, path




g = [
    [0, 0, 1, 1, 9, 0, 0, 0],
    [0, 0, 9, 4, 0, 0, 5, 0],
    [0, 9, 0, 0, 3, 0, 6, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 1, 0],
    [0, 0, 0, 0, 0, 0, 5, 0],
    [0, 0, 7, 0, 8, 1, 0, 0],
    [0, 0, 0, 0, 0, 1, 2, 0],
]
print(*g, sep='\n')
print()

s = int(input('От какой вершины старт: '))
print(dijkstra(g, s))