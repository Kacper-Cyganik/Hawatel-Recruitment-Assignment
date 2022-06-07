import requests
import logging


class NBP_API:
    '''
    Class providing a method to fetch current exchange rate of currency of user chocice.
    '''
    def __init__(self) -> None:
        self._base_url = 'http://api.nbp.pl/api/exchangerates/rates/a/'
        self._logger = logging.getLogger("my logger")

    def get_currency(self, currency_code: str) -> float:
        '''
        Get current exchange rate of given currency. Takes currency code as argument (like 'usd' for dollar & 'eur' for euro)
        '''
        endpoint = self._base_url+currency_code+'/'
        try:
            response = requests.get(endpoint)
            self._logger.info(f'Successful fetch at {endpoint}')
            return float(response.json()['rates'][0]['mid'])
        except requests.exceptions.RequestException as e:
            self._logger.error(f'Failed fetch at {endpoint} - {e}')
            return None
