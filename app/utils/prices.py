import requests

def get_price(coin_id):
    url = f"https://api.coingecko.com/api/v3/simple/price?ids={coin_id}&vs_currencies=usd"
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        data = response.json()
        return data[coin_id]["usd"]
    except Exception as e:
        print(f"❌ Error al obtener precio de {coin_id}: {str(e)}")
        return None
