import sys
import time
import os
import csv
from datetime import datetime

from dotenv import load_dotenv
load_dotenv()

# Añadir ruta al directorio raíz para importar utils
sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..')))

from utils.telegram import send
from utils.prices import get_price

SILENT_MODE = os.getenv("SILENT_MODE", "false").lower() == "true"

# Crear carpeta data si no existe
if not os.path.exists("data"):
    os.makedirs("data")

# Soporte multi-cripto
cryptos = ["bitcoin", "ethereum", "solana", "dogecoin"]

def basic_strategy(price):
    """Estrategia de trading simple basada en umbrales"""
    if price < 29000:
        return "🟢 COMPRA"
    elif price > 30500:
        return "🔴 VENTA"
    else:
        return "⏸️ MANTENER"

def save_to_csv(coin, price, signal):
    """Guarda histórico de precios por moneda"""
    file_path = f"data/history_{coin}.csv"
    timestamp = datetime.utcnow().strftime("%Y-%m-%d %H:%M:%S")
    file_exists = os.path.isfile(file_path)

    with open(file_path, mode="a", newline="") as csvfile:
        writer = csv.writer(csvfile)
        if not file_exists:
            writer.writerow(["timestamp", "price", "signal"])
        writer.writerow([timestamp, price, signal])

def notify(message):
    """Imprime y/o envía mensaje por Telegram"""
    print(message)
    if not SILENT_MODE:
        send(message)

def main():
    if not SILENT_MODE:
        if not os.getenv("TELEGRAM_TOKEN") or not os.getenv("TELEGRAM_CHAT_ID"):
            raise Exception("Faltan claves API en variables de entorno.")
        notify("🚀 FTMO Guard iniciado y monitoreando múltiples criptos.")
    else:
        print("🚀 FTMO Guard (modo silencioso) iniciado.")

    while True:
        for coin in cryptos:
            price = get_price(coin)
            if price is None:
                notify(f"⚠️ No se pudo obtener el precio de {coin.upper()}.")
                continue

            signal = basic_strategy(price)
            formatted_name = coin.upper()
            notify(f"💹 {formatted_name}: {price:.2f} USD\n📊 Señal: {signal}")
            save_to_csv(coin, price, signal)

        time.sleep(10)

if __name__ == "__main__":
    main()

