# Use the official Odoo image
FROM odoo:18 

# Set the working directory
WORKDIR /opt/odoo

# Copy custom addons and configuration (if any)
COPY ./addons /mnt/extra-addons
COPY ./odoo.conf /etc/odoo/odoo.conf

# Ensure proper permissions for addons
RUN chmod -R 777 /mnt/extra-addons

# Expose Odoo's default port
EXPOSE 8069

# Start Odoo
CMD ["odoo"]
