FROM python:3.10.11-alpine
WORKDIR /app
ENV TZ=Asia/Shanghai
ENV DOCKER_MODE=1
COPY requirements.txt requirements.txt
RUN apk add --no-cache \
    mysql-client \
    mariadb-connector-c \
    tzdata
RUN pip install --no-cache-dir -r requirements.txt
COPY bot ./bot
RUN mkdir ./log
COPY *.py ./
ENTRYPOINT [ "python3" ]
CMD [ "main.py" ]