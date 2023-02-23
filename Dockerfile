FROM python:3.10

ARG PROJECT_HOME=/opt/template-python-django
WORKDIR ${PROJECT_HOME}

ENV DEBIAN_FRONTEND=noninteractive \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    POETRY_VERSION=1.2.0 \
    PYTHONUNBUFFERED=1

# Install Python dependencies
RUN pip install "poetry==${POETRY_VERSION}" \
    && poetry config virtualenvs.create false
COPY poetry.lock pyproject.toml .
RUN poetry install --no-interaction --without dev

# Copy application source code
COPY . .

ENTRYPOINT ["./entrypoint.sh"]
