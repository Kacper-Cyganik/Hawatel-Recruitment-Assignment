import requests

url_euro = 'http://api.nbp.pl/api/exchangerates/rates/a/eur/'
url_dollar = 'http://api.nbp.pl/api/exchangerates/rates/a/usd/'

response = requests.get(url_dollar)
print('-----------------------')
print(response.json())
print('-----------------------')