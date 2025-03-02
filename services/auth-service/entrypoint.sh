#!/bin/sh

# Charger les variables depuis le secret Docker
if [ -f "/run/secrets/env_production" ]; then
  export $(cat /run/secrets/env_production | xargs)
fi

# Démarrer l'application
exec "$@"
