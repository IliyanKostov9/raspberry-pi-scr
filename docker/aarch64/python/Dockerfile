FROM python:3.11

RUN apt-get update && \
    apt-get install -y python3-pip && \
    python3-dev \
    build-essential \
    libffi-dev \
    libssl-dev \
    libxml2-dev libxslt-dev 

RUN python3.11 -m pip install --upgrade pip

