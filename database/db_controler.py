# example 
# link for TableDraw: https://github.com/AlexOdlin/TableDraw

import psycopg2 as pg
from tabledraw import Table

connect = pg.connect(host='localhost', user='postgres',
                           password='1', dbname='schedule_project')
cursor = connect.cursor()
cursor.execute("SELECT * FROM take_schedule_on_date('06-06-2018')")
results = cursor.fetchall()

table = Table('Schedule', ['День недели', '# пары', 'Время', 'Группа',
                           'Предмет', 'Преподаватель', 'Каб'])


mas = [[elem for elem in raw] for raw in results]
for elem in mas:
    table.insert_row(elem)

print(table.print_table(enum=True, style='gothic'))


connect.close()
