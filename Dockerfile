FROM python:3.10

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y \
    build-essential libsndfile1 vim \
    && rm -rf /var/lib/apt/lists/*

RUN pip install -e .
RUN python -m unidic download
RUN python melo/init_downloads.py

CMD ["python", "./melo/app.py", "--host", "0.0.0.0", "--port", "8888"]
