import logging
import pathlib
import csv

from mysql.connector import connect, Error
from nbp_api import NBP_API


class DBHandler:

    def __init__(self) -> None:
        self.connection = connect(
            host="localhost", user='kacper@localhost', password='kacper123', database='mydb')

        LOG_FORMAT = "%(levelname)s %(asctime)s %(message)s"
        logging.basicConfig(filename=f'{pathlib.Path(__file__).parent.resolve()}/logs.log',
                            level=logging.DEBUG, format=LOG_FORMAT)  # Create and configure logger
        self._logger = logging.getLogger('my logger')
        self._logger.info('Connected to mydb')
        self._logger.info('Hello')

    def _insert_currency_column(self, col_name: str) -> bool:
        try:
            my_cursor = self.connection.cursor()
            query = "ALTER TABLE Product ADD %s DECIMAL NOT NULL DEFAULT 1" % (
                col_name)
            my_cursor.execute(query)
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
        query = f"UPDATE Product SET UnitPriceUSD = UnitPrice*{exchange_rate_usd}, UnitPriceEuro = UnitPrice*{exchange_rate_euro}"
        try:
            cursor = self.connection.cursor()
            cursor.execute(query)
            cursor.close()
            self._logger.info('Update currencies')
            return True
        except Error:
            self._logger.error(f'Failed to update currencies - {Error}')
            return False

    def test(self):
        my_cursor = self.connection.cursor()
        my_cursor.execute("SHOW columns FROM Product")
        myresult = my_cursor.fetchall()
        for x in myresult:
            print(x)
            print()

    def generate_product_list_to_csv(self) -> bool:

        query = f'SELECT ProductID, DepartmentID, Category, IDSKU, ProductName, Quantity, UnitPrice, UnitPriceUSD, UnitPriceEuro, Ranking FROM Product'
        try:
            cursor = self.connection.cursor()
            cursor.execute(query)
            rows = cursor.fetchall()
        except Error:
            self._logger.error(f'Failed to read data from table Product - {Error}')

        result = list()
        column_names = list()

        for i in cursor.description:
            column_names.append(i[0])
        result.append(column_names)

        for row in rows:
            result.append(row)

        try:
            f = open('./utils/products.csv', 'rb')
        except OSError:
            self._logger.error("Could not open/read file")
            
        with open('./utils/products.csv', 'w') as f:
            myFile = csv.writer(f)
            for row in result:
                myFile.writerow(row)

        cursor.close()

    def __del__(self):
        try:
            self.connection.close()
            self._logger.info('Connection closed')
        except Error:
            self._logger.error(f'Failed to close connection - {Error}')
