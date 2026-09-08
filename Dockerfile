FROM python:3.12-slim

WORKDIR /app

ENV POETRY_VIRTUALENVS_CREATE=false

COPY poetry.lock pyproject.toml ./

RUN pip install --no-cache-dir poetry==2.0.0 && poetry install --no-root

COPY . .

EXPOSE 5000

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]