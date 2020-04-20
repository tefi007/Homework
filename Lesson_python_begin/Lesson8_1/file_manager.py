import sys
from File_and_folder import create_file, create_folder, get_list, delete_filedir, copy_filedir, save_info

save_info('Старт')
command = sys.argv[1]

if command == 'list':
    get_list()
elif command == 'create_file':
    try:
        name = sys.argv[2]
    except IndexError:
        print('Отсутствует название файла')
    else:
        create_file(name)
        try:
            text = sys.argv[3]
        except IndexError:
            pass
        else:
            create_file(name, text)
elif command == 'create_folder':
    try:
        name = sys.argv[2]
    except IndexError:
        print('Отсутствует название папки')
    else:
        create_folder(name)
elif command == 'delete':
    try:
        name = sys.argv[2]
    except IndexError:
        print('Отсутствует название файла/папки')
    except FileNotFoundError:
        print('Указанного файла/папки не существует')
    else:
        delete_filedir(name)
elif command == 'copy':
    try:
        name = sys.argv[2]
        new_name = sys.argv[3]
    except IndexError:
        print('Отсутствует название копируемого/нового файла/папки')
    except FileNotFoundError:
        print('Указанного файла/папки не существует')
    else:
        copy_filedir(name,new_name)
elif command == 'help':
    print('list - список файлов и папок')
    print('create_file - создание файла')
    print('create_folder - создание папки')
    print('delete - удаление файла, папки')
    print('copy - копирование файла, папки')

save_info ('Конец')

