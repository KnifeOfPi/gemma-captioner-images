FROM python:3.11-slim

WORKDIR /app

# Install system dependencies
RUN apt-get update --fix-missing && apt-get install -y --no-install-recommends \
    build-essential \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the handler and other necessary files
COPY handler.py .

# Set environment variables
ENV PYTHONUNBUFFERED=1

# Run the handler
CMD ["python", "handler.py"]
