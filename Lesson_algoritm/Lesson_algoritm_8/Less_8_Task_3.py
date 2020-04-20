# Написать программу, которая обходит не взвешенный ориентированный граф без петель, в котором все вершины связаны, по алгоритму поиска в глубину (Depth-First Search).
# a. граф должен храниться в виде списка смежности;
# b. генерация графа выполняется в отдельной функции, которая принимает на вход число вершин.

import random

def gen_graph(number):
    graph = []
    for i in range(number):
        n = random.randint(1, number - 1)
        g = []
        for j in range(n):
            while True:
                m = random.randint(0, number - 1)
                if m != i and (not m in g):
                    break
            g.append(m)
        graph.append(g)
    return graph

def graph_depth(graph, number, start, is_visited=None):
    if is_visited == None:
        is_visited = [False] * number
    is_visited[start] = True

    for i in graph[start]:
        if is_visited[i] == False:
            start = i
            graph_depth(graph, number, start, is_visited)

    return is_visited


num = int(input('Введите количество вершин предполагаемого графа: '))
graph_1 = gen_graph(num)
print(*graph_1, sep='\n')
print()

vert = int(input('Введите номер вершины для обхода: '))
print(graph_depth(graph_1, num, vert))