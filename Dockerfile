FROM alpine:latest
RUN apk add --no-cache ca-certificates wget unzip
WORKDIR /app
RUN wget -q https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip -O xray.zip && unzip -q xray.zip && rm xray.zip && chmod +x xray
COPY config.template.json /app/config.template.json
COPY entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
CMD ["/app/entrypoint.sh"]
