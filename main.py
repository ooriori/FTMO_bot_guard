"""
FTMO Crypto Trading Bot - Versión 2025
--------------------------------------
- Automatiza operaciones en exchanges.
- Modular y escalable, pensado para SaaS y contribuciones.
- No compartas ni publiques este archivo fuera del repositorio oficial.

Para contribuir, revisa CONTRIBUTING.md.
"""

import os
import time
from src.exchange import ExchangeConnector
from src.strategy import TradingStrategy

def main():
    api_key = os.getenv("API_KEY")
    api_secret = os.getenv("API_SECRET")
    if not api_key or not api_secret:
        raise Exception("Faltan claves API en variables de entorno.")

    exchange = ExchangeConnector(api_key, api_secret)
    strategy = TradingStrategy()

    print("Bot FTMO corriendo...")

    while True:
        data = exchange.get_market_data("BTCUSDT")
        signal = strategy.generate_signal(data)
        if signal == "buy":
            exchange.buy("BTCUSDT", 0.001)
        elif signal == "sell":
            exchange.sell("BTCUSDT", 0.001)
        time.sleep(60)

if __name__ == "__main__":
    main()
