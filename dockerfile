# Use an official Odoo base image
FROM odoo:16

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required system dependencies
RUN apt-get update && apt-get install -y \
    python3-pip \
    python3-venv \
    postgresql-client \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /odoo

# Copy the requirements file
COPY requirements.txt /odoo/requirements.txt

# Create and activate a virtual environment
RUN python3 -m venv venv && \
    . venv/bin/activate && \
    pip install --upgrade pip && \
    pip install -r requirements.txt

# Expose the default Odoo port
EXPOSE 8069

# Start Odoo
CMD ["odoo"]
