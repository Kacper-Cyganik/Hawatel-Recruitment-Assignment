from xmlrpc.client import Boolean
from mysql.connector import connect, Error

from api import NBP_API

class DBHandler:

    def __init__(self) -> None:
        self.connection = connect(host="localhost",user='kacper@localhost',password='kacper123', database='mydb')
    
    def insert_currency_column(self, col_name: str) -> Boolean:
        try:
            my_cursor = self.connection.cursor()
            query = "ALTER TABLE Product ADD %s DECIMAL NOT NULL DEFAULT 1" % (col_name)
            my_cursor.execute(query)
            return True
        except Error:
            print(Error)
            return False


    def test(self):
        my_cursor = self.connection.cursor()
        my_cursor.execute("SHOW columns FROM Product")
        myresult = my_cursor.fetchall()
        for x in myresult:
            print(x)
            print()


    def __del__(self):
        print('connection closed')
        try:
            self.connection.close()
        except Error:
            print(Error)








