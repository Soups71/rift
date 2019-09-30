FROM ubuntu:19.04

LABEL maintainer="richard@richardbew.com"

EXPOSE 5000

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip

RUN python3 -m pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python3" ]

CMD [ "run_dev.py" ]
