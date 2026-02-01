FROM python:3.11
WORKDIR /app
# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
# Copy the handler and other necessary files
COPY handler.py .
# Set environment variables
ENV PYTHONUNBUFFERED=1
# Run the handler
CMD ["python", "handler.py"]
