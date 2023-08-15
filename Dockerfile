# Use a base image with Python 3
FROM python:3.9-slim

# Set environment variables for Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Create and set the working directory
WORKDIR /app

# Install dependencies
# First, we copy only the requirements.txt file to leverage Docker's cache
COPY requirements.txt /app/
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Copy the entire project
COPY . /app/
