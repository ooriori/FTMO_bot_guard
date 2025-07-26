#!/bin/bash

# Nombre del proyecto
PROYECTO="ftmo_bot"

echo "Creando estructura de proyecto para $PROYECTO..."

mkdir -p $PROYECTO/src

# main.py
cat > $PROYECTO/main.py << 'EOF'
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
EOF

# src/exchange.py
cat > $PROYECTO/src/exchange.py << 'EOF'
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
EOF

# src/strategy.py
cat > $PROYECTO/src/strategy.py << 'EOF'
class TradingStrategy:
    def generate_signal(self, data):
        if int(data["price"]) % 2 == 0:
            return "buy"
        return "sell"
EOF

# README.md
cat > $PROYECTO/README.md << 'EOF'
# FTMO Crypto Trading Bot

Automatiza trading de criptomonedas en 2025. Modular, seguro y pensado para escalar a SaaS.

## 🚀 ¿Qué hace?
- Opera de forma automática en exchanges.
- Modular: agrega estrategias, exchanges y análisis fácilmente.
- Seguro: variables de entorno para claves API.

## 📦 Estructura básica

\`\`\`
ftmo_bot/
├── main.py
└── src/
    ├── exchange.py
    └── strategy.py
\`\`\`

## 🛡️ Licencia

El uso comercial, la copia o distribución del código fuera de este repositorio está prohibida. Solo contribuciones permitidas bajo supervisión.

## 🏆 ¿Cómo contribuir?
Lee [CONTRIBUTING.md](CONTRIBUTING.md).

## 🎯 Futuro SaaS

Este proyecto busca ser la base de un SaaS de trading algorítmico y signals. ¡Súmate a la comunidad!
EOF

# LICENSE
cat > $PROYECTO/LICENSE << 'EOF'
Copyright (c) 2025 ooriori

Todos los derechos reservados.

Se prohíbe la copia, distribución o uso comercial del código fuera de este repositorio.
Solo se permite la colaboración bajo revisión y aprobación del propietario.
EOF

# CONTRIBUTING.md
cat > $PROYECTO/CONTRIBUTING.md << 'EOF'
# Contribuir a FTMO Bot

Queremos sumar ideas, pero el código está protegido. Las contribuciones pasan por revisión y solo los mejores aportes serán integrados.

- Los pull requests deben ser revisados por el owner.
- Prohibida la copia o redistribución no autorizada.
- Si colaboras y el SaaS genera ingresos, habrá recompensas.

**Importante:** No publiques el código fuera de este repo.
EOF

cd $PROYECTO
git init
git add .
git commit -m "init: estructura base FTMO Bot 2025"

echo "¡Listo! Ahora crea un repo en GitHub y ejecuta:"
echo "git remote add origin TU_URL_DEL_REPO"
echo "git branch -M main"
echo "git push -u origin main"

