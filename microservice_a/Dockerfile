FROM python:3.10-slim

RUN pip install pipenv

WORKDIR /app

COPY Pipfile Pipfile.lock /app
RUN pipenv install --system --deploy

COPY main.py /app

EXPOSE 5000

CMD ["pipenv", "run", "python", "main.py"]
