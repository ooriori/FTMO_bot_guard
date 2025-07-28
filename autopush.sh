#!/bin/bash

# AutoPush para FTMO_bot_guard - by Oriori

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

# Verifica si hay cambios antes de hacer commit
if git diff --quiet && git diff --cached --quiet; then
  echo "⚠️  No hay cambios para subir. Nada que hacer."
  exit 0
fi

# Mensaje de commit automático si no se proporciona uno
COMMIT_MSG=${1:-"🚀 AutoPush FTMO $(date '+%Y-%m-%d %H:%M:%S')"}

echo "➕ Añadiendo archivos..."
git add .

echo "✅ Haciendo commit: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

echo "⬆️ Haciendo push al repositorio remoto origin/main..."
git push origin main

echo "✅ ¡Push completado con éxito al repositorio FTMO_bot_guard!"

