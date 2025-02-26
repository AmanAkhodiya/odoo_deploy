# Use the official Odoo image as the base
FROM odoo:16.0

# Install dependencies
RUN apt-get update && apt-get install -y gettext-base

# Copy custom modules and configuration file
COPY ./custom_modules /mnt/extra-addons
COPY ./odoo.conf /etc/odoo/odoo.conf.template

# Substitute environment variables in odoo.conf
RUN envsubst < /etc/odoo/odoo.conf.template > /etc/odoo/odoo.conf

# Copy entrypoint script
COPY ./entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Expose the Odoo port
EXPOSE 8069