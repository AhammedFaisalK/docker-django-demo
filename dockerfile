# Use Python 3.10 image to match your environment
FROM python:3.10-slim

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

ENTRYPOINT ["/bin/bash", "-c"]
CMD ["python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]