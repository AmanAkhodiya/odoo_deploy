#!/bin/bash

# Check if the database is already initialized
if ! psql -h $DB_HOST -U $DB_USER -d $DB_NAME -c "SELECT * FROM ir_module_module LIMIT 1;" &> /dev/null; then
    echo "Initializing Odoo database..."
    odoo -d $DB_NAME -i base --stop-after-init
else
    echo "Database already initialized. Skipping initialization."
fi

# Start Odoo
echo "Starting Odoo..."
odoo