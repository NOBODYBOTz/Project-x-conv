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

# Expose port
EXPOSE 8080

# Run command
CMD ["python3", "-m", "Assistant"]
