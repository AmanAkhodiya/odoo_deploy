# Use the official Odoo image as the base
FROM odoo:16.0

# Copy custom modules and configuration file
COPY ./addons /mnt/extra-addons
COPY ./odoo.conf /etc/odoo/odoo.conf.template

COPY --chown=odoo:odoo ./entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Expose the Odoo port
EXPOSE 8069