FROM python:alpine

RUN apk add --update postgresql-client && apk --purge del apk-tools

RUN python3 -m venv /yacron && /yacron/bin/pip install yacron

COPY yacrontab.yaml /etc/yacron.d/yacrontab.yaml

COPY entrypoint.sh /home/root/entrypoint.sh

ENTRYPOINT ["/home/root/entrypoint.sh"]