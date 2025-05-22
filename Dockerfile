FROM python:3.10-slim

WORKDIR /app

COPY . .

CMD ["python", "app.py"]
COPY requirements.txt .
RUN pip install -r requirements.txt
