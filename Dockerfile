from python:3.8-slim-buster
workdir /app
copy requirements.txt .
run python m pip install -r requirements.txt
copy . /app
cmd ["gunicorn", "--workers=2", "--bind", "0.0.0.0:5000", "-c", "config.py", "app:app"]
