class TradingStrategy:
    def generate_signal(self, data):
        if int(data["price"]) % 2 == 0:
            return "buy"
        return "sell"
