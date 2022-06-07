import nbp_api
import database

if __name__ == "__main__":

    print('API TEST')
    print('-----------------')
    nbp = nbp_api.NBP_API()
    print(nbp.get_currency('eur'))
    print('-----------------')

    print('DB TEST')
    print('-----------------')

    db = database.DBHandler()
    db.update_currencies()

    print('-----------------')

