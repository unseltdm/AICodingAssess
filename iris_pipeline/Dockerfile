# docker build . -t iris_pipeline
FROM python:3.13.0

RUN pip install --upgrade pip && pip install pandas scikit-learn

WORKDIR /opt/pipeline/

RUN mkdir -p /opt/pipeline/data /opt/pipeline/scripts
COPY scripts/ /opt/pipeline/scripts/