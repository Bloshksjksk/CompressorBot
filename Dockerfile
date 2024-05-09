#FROM python:3.9.2-slim-buster
#RUN mkdir /bot && chmod 777 /bot
#WORKDIR /bot
#ENV DEBIAN_FRONTEND=noninteractive
# RUN apt -qq update && apt -qq install -y git wget pv jq wget python3-dev ffmpeg mediainfo
#COPY . .
#RUN pip3 install -U -r requirements.txt
#CMD ["bash","run.sh"]

FROM python:3.9

WORKDIR /app

COPY requirements.txt /app/
RUN pip3 install -r requirements.txt
COPY . /app

# CMD gunicorn app:app & python3 bot.py
CMD python3 start.py

EXPOSE 80
