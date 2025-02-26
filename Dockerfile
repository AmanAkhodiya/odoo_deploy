# Use the official Odoo image as the base
FROM odoo:16.0

# Copy custom modules and configuration file
COPY ./custom_modules /mnt/extra-addons
COPY ./odoo.conf /etc/odoo/odoo.conf.template

# Copy entrypoint script
COPY ./entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Expose the Odoo port
EXPOSE 8069