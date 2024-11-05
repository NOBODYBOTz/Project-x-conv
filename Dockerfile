# Use official Python image
FROM python:3.10.6-slim

# Set working directory
WORKDIR /app

# Update pip and install git
RUN apt update && apt install -y git && pip install --upgrade pip

# Copy requirements file
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

EXPOSE 8080

COPY start.sh /app/start.sh

# Make the start.sh script executable
RUN chmod +x /app/start.sh

# Run start.sh when the container launches
CMD ["/app/start.sh"]
