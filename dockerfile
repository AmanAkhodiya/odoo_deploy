# Use the official Odoo 16 image
FROM odoo:16

# Set environment variables for Odoo database connection
ENV HOST=db
ENV USER=odoo
ENV PASSWORD=odoo

# Set working directory
WORKDIR /mnt/extra-addons

# Copy all custom modules & configuration files
COPY ./addons /mnt/extra-addons
COPY ./odoo.conf /etc/odoo/odoo.conf

# Ensure correct permissions
RUN chown -R odoo:odoo /mnt/extra-addons /etc/odoo/odoo.conf

# Expose Odoo default ports
EXPOSE 8069 8071

# Define the entrypoint command to start Odoo
CMD ["odoo", "--config=/etc/odoo/odoo.conf"]
