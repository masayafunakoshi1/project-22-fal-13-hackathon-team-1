FROM python:3.9-slim-buster

WORKDIR /myportfolio
#we are specifying /myportfolio directory as the working directory of the container image

COPY requirements.txt .
#utilize docker layer caching to cache lines 1 - 7 as long as requiremets.txt has not changed

RUN pip3 install -r requirements.txt
#install dependencies

COPY . .

CMD ["flask", "run", "--host=0.0.0.0"]
#specify the command that runs when a container is created from this container image

EXPOSE 5000
#specify the port that will be exposed from the container. In our case, PORT 5000 by default
