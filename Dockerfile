FROM python:3.6-slim-stretch AS base
ENV PYROOT /pyroot
ENV PYTHONUSERBASE $PYROOT

#FROM base AS builder
RUN pip install pipenv
COPY Pipfile* ./
RUN PIP_USER=1 PIP_IGNORE_INSTALLED=1 pipenv install --system --deploy --ignore-pipfile

#FROM base
#COPY --from=builder $PYROOT/lib/ $PYROOT/lib/
COPY *.py ./

EXPOSE 8080

CMD ["python","-u","main.py"]