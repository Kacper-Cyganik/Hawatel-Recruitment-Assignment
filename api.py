import requests

class NBP_API:

    def __init__(self) -> None:
        self._base_url = 'http://api.nbp.pl/api/exchangerates/rates/a/'

    def get_currency(self, currency_code: str) -> float:
        endpoint = self._base_url+currency_code+'/'
        try:
            response = requests.get(endpoint)
            return response.json()['rates'][0]['mid']
        except requests.exceptions.RequestException as e:
            print(e)
            return None
