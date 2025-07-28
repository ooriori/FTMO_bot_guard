# FTMO Guard — Sistema Anti-liquidación para Traders Profesionales

**FTMO Guard** es una herramienta avanzada y automatizada diseñada para proteger cuentas de trading financiadas o de alto valor, como las de **FTMO, MyForexFunds** y plataformas similares. Este sistema monitorea en tiempo real los precios del mercado cripto, aplica estrategias de mitigación, y envía alertas preventivas para evitar pérdidas catastróficas en condiciones de mercado adversas.

---

##  ¿Qué hace FTMO Guard?

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

##  Instalación y Puesta en Marcha

### 1. Clona el repositorio

```bash
git clone https://github.com/ooriori/FTMO_bot_guard.git
cd FTMO_bot_guard
```

2. Crea tu archivo .env

Necesitarás agregar un archivo .env en la raíz del proyecto con tus credenciales personales:

TELEGRAM_BOT_TOKEN=tu_token_de_bot
TELEGRAM_CHAT_ID=tu_chat_id
SYMBOLS=BTC/USDT,ETH/USDT,SOL/USDT,DOGE/USDT

    Nota: Puedes modificar los pares monitoreados en SYMBOLS.

3. Ejecuta el bot en modo Docker

Si tienes Docker y Docker Compose instalados, ejecuta:

sudo docker compose up --build

Esto levantará el servicio en segundo plano, totalmente aislado y listo para producción.
4. Alternativa: Modo manual (sin Docker)

Instala las dependencias localmente:

pip install -r requirements.txt
python main.py

5. Automatiza tus cambios (opcional)

El repositorio incluye un script autopush.sh que permite subir automáticamente tus cambios a GitHub:

chmod +x autopush.sh
./autopush.sh "mensaje de commit"

🧪 Tests y Verificación

En versiones futuras se incorporarán pruebas unitarias y de integración automatizadas mediante GitHub Actions.
🛡️ Caso de Uso Empresarial

FTMO Guard está diseñado para traders profesionales que:

    Operan con cuentas evaluadas por fondos de terceros (prop firms).

    Necesitan vigilancia pasiva 24/7 de los precios.

    Quieren evitar la liquidación automática de sus posiciones sin necesidad de estar conectados.

Puede ser adaptado para brokers, fondos de cobertura o sistemas internos de control de riesgo.
📩 Soporte y Contribuciones

Para soporte técnico, propuestas de mejora o colaboración profesional:

    GitHub: github.com/ooriori/FTMO_bot_guard

    Contacto directo: [Próximamente canal privado para partners y traders beta]

📝 Licencia

MIT License — libre para uso comercial y modificación bajo los términos de atribución.
🔒 Nota Legal

Este bot no constituye asesoría financiera ni garantiza resultados. Úsese bajo su propio criterio y responsabilidad.


---

### ✅ ¿Qué sigue?

- ¿Quieres que te lo deje listo como `README.md` real y lo subamos con `autopush.sh`?
- ¿Quieres agregar una sección de *pricing*, roadmap, o integración futura con trading real?

Te puedo ayudar a dejarlo **corporativo**, para inversión o venta directa
