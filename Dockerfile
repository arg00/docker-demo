FROM ubuntu:latest

# Build instructions...
RUN apt-get update -y && apt-get install -y python3 python3-pip

COPY --chown=mochie:mochie app /app/
WORKDIR /app
RUN pip3 install -r requirements.txt

ENV FLASK_APP=hello.py
ENV FLASK_ENV=development

# Boot command
CMD ["flask", "run", "--host", "0.0.0.0"]