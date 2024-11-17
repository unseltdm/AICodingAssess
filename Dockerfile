# FROM ubuntu:20.04
# RUN apt-get update
# RUN apt-get install wget -y

FROM python:3.9

RUN pip install pandas scikit-learn
RUN mkdir -p /scripts/ /input/
COPY /scripts/iris.py /scripts/
COPY /scripts/splice.py /scripts/
COPY /input/Iris.csv /input/
COPY /output/ /output/
