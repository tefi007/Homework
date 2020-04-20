import itertools

for p in itertools.permutations('КОМАР',3):
    print(''.join(p))
print('#' * 20)
for p in itertools.combinations('КОМАР',3):
    print(''.join(p))