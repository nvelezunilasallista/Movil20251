FROM python:3.13.2-alpine

COPY ./requirements.txt /app/requirements.txt
COPY ./api.py /app/api.py

WORKDIR /app

RUN pip install -r requirements.txt

ENTRYPOINT ["python"]

CMD ["api.py"]

EXPOSE 80
