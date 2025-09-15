FROM python:3

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_DEBUG=true

EXPOSE 5000

CMD ["flask", "run", "-h", "0.0.0.0"]
