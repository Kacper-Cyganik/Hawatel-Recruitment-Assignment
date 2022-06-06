from mysql.connector import connect, Error

def insert_currency_column(connection, col_name: str) -> None:
    try:
        my_cursor = connection.cursor()
        query = "ALTER TABLE Product ADD %s DECIMAL NOT NULL DEFAULT 1" % (col_name)
        my_cursor.execute(query)
    except Error:
        print(Error)
    print('OK')

try:
    with connect(host="localhost",user=input("Enter username: "),password=getpass("Enter password: "),) as connection:
        print(connection)


        # insert_currency_column(connection=connection, col_name='UnitPriceUSD')
        #insert_currency_column(connection=connection, col_name='UnitPriceEURO')

        #my_cursor.execute("SELECT * FROM Product")
        
        # my_cursor = connection.cursor()
        # my_cursor.execute("SHOW columns FROM Product")
        # myresult = my_cursor.fetchall()
        # for x in myresult:
        #     print(x)
        #     print()
except Error as e:
    print(e)







