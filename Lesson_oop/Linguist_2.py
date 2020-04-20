class Word:
    '''text'''
    def __init__(self, text):
        self.text = text


class Sentence:
    '''text'''
    def __init__(self,words):
        self.content = words

    def show(self):
        s=''
        for n in self.content:
            s += words[n].text + ' '
        return s

    def show_parts(self):
        li = []
        for n in self.content:
            if not words[n].part in li:
                li.append(words[n].part)
        return li

class Noun(Word):
    __grammar = 'сущ'
    part = 'существительное'

class Verb(Word):
    __grammar = 'гл'
    part = 'глагол'

class Adjective(Word):
    __grammar = 'прил'
    part = 'прилагательное'

class Preposition(Word):
    __grammar = 'предлог'
    part = 'предлог'

words = []

words.append(Adjective('красная'))
words.append(Noun('шапочка'))
words.append(Verb('пошла'))
words.append(Preposition('в'))
words.append(Noun('лес'))
words.append(Preposition('за'))
words.append(Noun('грибами'))

sentence = Sentence([0, 1, 2, 3, 4, 5, 6])

print(sentence.show())
print(sentence.show_parts())