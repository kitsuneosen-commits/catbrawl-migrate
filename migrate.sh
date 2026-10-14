#!/bin/sh
set -e
echo "MIGRATE: downloading schema..."
wget -q -O /tmp/s.sql https://cat-brawl.netlify.app/adventure-schema.sql
echo "MIGRATE: applying..."
psql "postgresql://catbrawl:DYShi5sp8FwJWb86VOf7JMV7XTMUfBgo@dpg-db5kh8ad0e5s73fps870-a.oregon-postgres.render.com:5432/catbrawl" -f /tmp/s.sql
echo "MIGRATE_DONE"
# 保持容器存活一段时间以便日志可查
sleep 600
