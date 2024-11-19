# docker build . -t iris_pipeline
FROM python:latest

RUN pip install pandas scikit-learn
RUN mkdir -p data scripts modules
COPY data/Iris.csv data
RUN chmod -R 775 data

COPY scripts/slice_data_final.py /scripts/
COPY scripts/fit.py /scripts/
RUN chmod -R 775 scripts

COPY output/ /output/