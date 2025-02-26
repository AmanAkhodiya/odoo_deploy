# Use the official Odoo image as the base
FROM odoo:16.0

# Create directories for logs and data
RUN mkdir -p /var/log/odoo && \
    mkdir -p /var/lib/odoo

# Copy custom modules and configuration file
COPY ./addons /mnt/extra-addons

# Expose the Odoo port
EXPOSE 8069

# Set the default command to run Odoo
CMD ["odoo"]