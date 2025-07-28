# FTMO Guard — Sistema Anti-liquidación para Traders Profesionales

**FTMO Guard** es una herramienta avanzada y automatizada diseñada para proteger cuentas de trading financiadas o de alto valor, como las de **FTMO, MyForexFunds** y plataformas similares. Este sistema monitorea en tiempo real los precios del mercado cripto, aplica estrategias de mitigación, y envía alertas preventivas para evitar pérdidas catastróficas en condiciones de mercado adversas.

---

## 🧠 ¿Qué hace FTMO Guard?

FTMO Guard es un bot que actúa como un "sistema de defensa personalizable" para traders. Entre sus funcionalidades principales se incluyen:

- ✅ Monitoreo en tiempo real de los precios de **BTC, ETH, SOL y DOGE**.
- ✅ Estrategia automatizada de **compra y venta básica** con condiciones predefinidas.
- ✅ Registro de **historial de precios por criptomoneda** para auditoría y análisis.
- ✅ Integración con **Telegram** para el envío inmediato de alertas.
- ✅ Funcionamiento en segundo plano bajo **modo silencioso** o **modo normal**, según preferencias del usuario.
- ✅ Arquitectura modular que permite fácil extensión a nuevas monedas y alertas.

---

## ⚙️ Arquitectura Técnica

- **Lenguaje principal:** Python 3.10
- **Contenedorización:** Docker y Docker Compose
- **Modo de ejecución:** Servicio persistente con opción a integración CI/CD
- **Almacenamiento:** Archivos CSV por moneda (histórico)
- **Alertas:** Sistema de mensajería Telegram vía bot token
- **Dependencias clave:** `ccxt`, `python-telegram-bot`, `pandas`, `dotenv`

---

## 🚀 Instalación y Puesta en Marcha

### 1. Clona el repositorio

```bash
git clone https://github.com/ooriori/FTMO_bot_guard.git
cd FTMO_bot_guard
