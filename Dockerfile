# docker build . -t iris_pipeline
FROM python:3.13.0

RUN pip install pandas==2.2.1 scikit-learn==1.5.1

WORKDIR /opt/pipeline/

RUN mkdir -p /opt/pipeline/data /opt/pipeline/scripts
# COPY data/Iris.csv /opt/pipeline/data
COPY scripts/ /opt/pipeline/scripts/