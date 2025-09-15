FROM alpine

EXPOSE 80

RUN apk update && \
    apk add --no-cache nginx && \
    apk add --no-cache unzip && \
    apk add curl

WORKDIR /app

RUN curl -Lo FullScreenMario-master.zip https://archive.org/download/FullScreenMarioSourceCode/FullScreenMario-master.zip 

RUN unzip FullScreenMario-master.zip &&\
    rm FullScreenMario-master.zip

COPY default.conf /etc/nginx/http.d/default.conf

CMD ["nginx", "-g", "daemon off;"]
