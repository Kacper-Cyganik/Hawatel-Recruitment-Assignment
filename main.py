import DBHandler as DBHandler
import sys
import argparse
import logging
import config
import pathlib

if __name__ == "__main__":

    # Create and configure logger
    logging.basicConfig(filename=f'{pathlib.Path(__file__).parent.resolve()}/logs.log',
                            level=logging.DEBUG, format=config.LOG_FORMAT)  
    
    # Help text
    parser = argparse.ArgumentParser(
        formatter_class=argparse.RawTextHelpFormatter)
    parser.add_argument("-g", dest='generate',
                        help="generate products.csv file containing list of all products (argument: filename)")
    parser.add_argument(
        "-u", dest='update', help='update product prices in mydb.Product (UnitPriceUSD and UnitPriceEuro) (argument: None)', action='store_true')
    parser.add_argument(
        "-t", dest='test', help='see all products price (PLN, USD, EURO)', action='store_true')

    args = parser.parse_args()

    # Handle program arguments
    # Handle update
    if args.update:
        db = DBHandler.DBHandler()
        db.update_currencies()
        print('update successful')

    # Handle generate
    if args.generate:
        db = DBHandler.DBHandler()
        db.generate_product_list_to_csv(filename=args.generate)

    # Test
    if args.test:
        db = DBHandler.DBHandler()
        db.show_columns()

    # No args
    if len(sys.argv) == 1:
        parser.print_help()
