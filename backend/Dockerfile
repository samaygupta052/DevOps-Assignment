# ---------- Builder stage ----------
FROM python:3.11-slim AS builder

WORKDIR /app

# Install system dependencies (minimal)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
 && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---------- Runtime stage ----------
FROM python:3.11-slim

WORKDIR /app

# Create non-root user
RUN useradd -m appuser

# Copy installed packages from builder
COPY --from=builder /usr/local /usr/local

# Copy application code
COPY app app

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 8000

# Run app
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]

