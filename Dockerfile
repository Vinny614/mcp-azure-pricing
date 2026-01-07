FROM python:3.13.2-slim

WORKDIR /app

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Copy source code
COPY . .

# Set environment variables
ENV MCP_HOST=0.0.0.0
ENV MCP_PORT=8080
ENV MCP_DEBUG=false
ENV MCP_RELOAD=false
ENV LOG_LEVEL=INFO

EXPOSE 8080

CMD ["uvicorn", "azure_pricing_mcp_server:get_application", "--host", "0.0.0.0", "--port", "8080"]
