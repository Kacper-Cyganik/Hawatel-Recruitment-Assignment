import logging
import csv
import config

from mysql.connector import connect, Error
from nbp_api import NBP_API


class DBHandler:

    def __init__(self) -> None:
    
        self._logger = logging.getLogger('my logger')
        try:
            self.connection = connect(
                host=config.DB_HOST, user=config.DB_USER, password=config.DB_PASSWORD, database=config.DB_NAME)
        except Error:
            self._logger.error(f'Failed to connect to databse - {Error}')
        self._logger.info('Connected to mydb')

    def _insert_currency_column(self, col_name: str) -> bool:
        try:
            cursor = self.connection.cursor()
            query = "ALTER TABLE Product ADD %s DECIMAL NOT NULL DEFAULT 1" % (
                col_name)
            cursor.execute(query)
            self.connection.commit()
            cursor.close()
            self._logger.info(f"Created column {col_name} in 'Product'")
            return True
        except Error:
            print(Error)
            self._logger.error(Error)
            return False

    def update_currencies(self) -> bool:

        nbp = NBP_API()
        exchange_rate_usd = nbp.get_currency('usd')
        exchange_rate_euro = nbp.get_currency('eur')
        print(exchange_rate_usd, exchange_rate_euro)
        query = f"UPDATE Product SET UnitPriceUSD = UnitPrice*{exchange_rate_usd}, UnitPriceEuro = UnitPrice*{exchange_rate_euro}"
        try:
            cursor = self.connection.cursor()
            cursor.execute(query)
            self.connection.commit()
            cursor.close()
            self._logger.info('Update currencies')
            return True
        except Error:
            self._logger.error(f'Failed to update currencies - {Error}')
            return False

    def show_columns(self):
        my_cursor = self.connection.cursor()
        my_cursor.execute(
            "SELECT UnitPrice, UnitPriceUSD, UnitPriceEuro FROM Product")
        myresult = my_cursor.fetchall()
        for x in myresult:
            print(x)

    def generate_product_list_to_csv(self, filename: str) -> bool:

        query = f'SELECT ProductID, DepartmentID, Category, IDSKU, ProductName, Quantity, UnitPrice, UnitPriceUSD, UnitPriceEuro, Ranking FROM Product'
        try:
            cursor = self.connection.cursor()
            cursor.execute(query)
            rows = cursor.fetchall()
        except Error:
            self._logger.error(
                f'Failed to read data from table Product - {Error}')

        result = list()
        column_names = list()

        for i in cursor.description:
            column_names.append(i[0])
        result.append(column_names)

        for row in rows:
            result.append(row)

        with open(f'./{filename}.csv', 'w') as f:
            myFile = csv.writer(f)
            for row in result:
                myFile.writerow(row)
            self._logger.info(f'Successful I/O operation on {filename}.csv.')
        cursor.close()

    def __del__(self):
        try:
            self.connection.close()
            self._logger.info('Connection closed')
        except Error:
            self._logger.error(f'Failed to close connection - {Error}')
