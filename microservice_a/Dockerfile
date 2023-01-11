FROM python:3.10-alpine

RUN apk add --update --no-cache netcat-openbsd \
    && pip install pipenv \
    && adduser -D worker

WORKDIR /app
USER worker

# install deps
COPY --chown=worker:worker Pipfile Pipfile.lock /app/
RUN whoami && \
  pipenv install

# copy app
COPY --chown=worker:worker main.py /app/

EXPOSE 5000

HEALTHCHECK --interval=90s --timeout=5s \
  CMD nc -z -v 127.0.0.1 5000

CMD ["pipenv", "run", "server"]
