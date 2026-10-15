#!/bin/sh
set -e
echo "MIGRATE: downloading schema..."
wget -q -O /tmp/s.sql https://cat-brawl.netlify.app/tactics-schema.sql
echo "MIGRATE: applying..."
psql "postgresql://catbrawl:DYShi5sp8FwJWb86VOf7JMV7XTMUfBgo@dpg-db5kh8ad0e5s73fps870-a:5432/catbrawl" -f /tmp/s.sql
psql "postgresql://catbrawl:DYShi5sp8FwJWb86VOf7JMV7XTMUfBgo@dpg-db5kh8ad0e5s73fps870-a:5432/catbrawl" -c "GRANT ALL ON TABLE cat_tactics TO anon; ALTER TABLE cat_tactics ENABLE ROW LEVEL SECURITY; CREATE POLICY cat_tactics_all ON cat_tactics TO anon USING (true) WITH CHECK (true);"
echo "MIGRATE_DONE"
sleep 600
