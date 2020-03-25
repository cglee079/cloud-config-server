FROM java:8
WORKDIR /

RUN mkdir -p /app
COPY ./ /app/

RUN echo "Asia/Seoul" > /etc/timezone

CMD java \
    -jar \
    -Dspring.profiles.active=deploy \
    -Dspring.config.additional-location=file:/app/ \
    -Xms256m \
    -Xmx256m \
    -XX:NewSize=128m \
    -XX:MaxNewSize=128m \
    -XX:MetaspaceSize=50M \
    /app/$(ls /app | grep -E '.*\.jar')
