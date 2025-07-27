import requests

def get_price(coin):
    try:
        url = f"https://api.coingecko.com/api/v3/simple/price?ids={coin}&vs_currencies=usd"
        response = requests.get(url, timeout=10)
        data = response.json()
        return data[coin]["usd"]
    except Exception:
        return None

