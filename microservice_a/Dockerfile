FROM python:3.10-alpine

RUN apk add --update --no-cache netcat-openbsd \
    && pip install pipenv \
    && adduser -D worker

WORKDIR /app
USER worker

# install deps
COPY --link --chown=worker:worker Pipfile Pipfile.lock /app/
RUN whoami && \
  pipenv install

# copy app
COPY --chown=worker:worker main.py /app/

EXPOSE 5000

HEALTHCHECK --interval=15s --timeout=3s --start-period=10s \
  CMD nc -z -v 127.0.0.1 5000 || exit 1

CMD ["pipenv", "run", "server"]
