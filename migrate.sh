#!/bin/sh
set -e
echo "MIGRATE: applying grants..."
psql "postgresql://catbrawl:DYShi5sp8FwJWb86VOf7JMV7XTMUfBgo@dpg-db5kh8ad0e5s73fps870-a:5432/catbrawl" -c "GRANT SELECT, INSERT, UPDATE, DELETE ON cat_adventure, cat_auctions TO anon; GRANT USAGE, SELECT ON SEQUENCE cat_auctions_id_seq TO anon;"
echo "MIGRATE_DONE"
sleep 600
