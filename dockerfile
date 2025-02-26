# Use the official Python image
FROM python:3.12

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Ensure Odoo is installed
RUN python -c "import odoo; print(odoo.__version__)"

# Set execute permissions for odoo-bin
RUN chmod +x odoo-bin
