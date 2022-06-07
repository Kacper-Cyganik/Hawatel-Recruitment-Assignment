import nbp_api
import database
import argparse


if __name__ == "__main__":
    
    # Help text
    parser = argparse.ArgumentParser("help", formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument("-g", help='''Generate products.csv file containing list of all products (in root/utils directory):
    a. ProductID
    b. DepartmentID
    c. Category
    d. IDSKU
    e. ProductName
    f. Quantity
    g. UnitPrice
    h. UnitPriceUSD
    i. UnitPriceEuro
    j. Ranking\n''', type=int)
    parser.add_argument("-u", help='Update product prices in mydb.Product (UnitPriceUSD and UnitPriceEuro)')
    args = parser.parse_args()
    print(args.counter + 1)

    # Handle program arguments
    

    db = database.DBHandler()
    db.update_currencies()
    db.test()
    db.generate_product_list_to_csv()

    print('-----------------')

