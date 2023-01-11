FROM python:3.10-alpine

RUN pip install pipenv && \
    adduser -D worker

WORKDIR /app
USER worker

# install deps
COPY --chown=worker:worker Pipfile Pipfile.lock /app/
RUN whoami && \
  pipenv install

# copy app
COPY --chown=worker:worker main.py /app/

EXPOSE 5000

CMD ["pipenv", "run", "server"]
