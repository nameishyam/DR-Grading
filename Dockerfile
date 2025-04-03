# Use an official Python runtime as a parent image
FROM python:3.8-slim

# Install necessary system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender-dev \
 && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy the rest of your application code
COPY . /app

# Expose the port the app runs on
EXPOSE 5000

# Define environment variable for Flask (optional)
ENV FLASK_APP=app.py

# Run the application
CMD ["python", "app.py"]
