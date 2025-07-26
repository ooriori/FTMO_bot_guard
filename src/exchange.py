class ExchangeConnector:
    def __init__(self, api_key, api_secret):
        self.api_key = api_key
        self.api_secret = api_secret

    def get_market_data(self, symbol):
        # Simulación de precio
        return {"price": 70000, "timestamp": 123456789}

    def buy(self, symbol, amount):
        print(f"Ejecutando BUY: {symbol}, cantidad: {amount}")

    def sell(self, symbol, amount):
        print(f"Ejecutando SELL: {symbol}, cantidad: {amount}")
