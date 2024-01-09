
#!/bin/bash

PLUGIN_DIR="/config"
CONFIG_DIR="/etc/yate-config"
SOURCE_DIR="/etc/yate"

if [ ! -d "/config/yate" ]; then
  mkdir -p "/config/yate"
fi

if [ ! -d "/config/ssl" ]; then
  mkdir -p "/config/ssl"
fi

if [ -z "$(find "$PLUGIN_DIR/yate" -maxdepth 1 -name '*.conf')" ]; then
    cp "$CONFIG_DIR"/*.conf "$PLUGIN_DIR/yate"
fi

if [ ! -z "$(find "/config/ssl/" -maxdepth 1 -type f)" ]; then
    cp /config/ssl/* /etc/yate/ssl/
fi

cp /config/yate/*.conf /etc/yate/

exec "$@" 