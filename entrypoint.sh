#!/bin/bash

if  [ ! -f "/app/saves/world_save" ]; then
  /app/bin/x64/factorio --create world_save
fi

/app/bin/x64/factorio --start-server world_save