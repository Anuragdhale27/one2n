FROM alpine:3.12

RUN apk add --no-cache curl bash

RUN mkdir -p /metrics

COPY metrics-collector.sh /usr/local/bin/metrics-collector.sh

RUN chmod +x /usr/local/bin/metrics-collector.sh

CMD ["bash", "-c","/usr/local/bin/metrics-collector.sh"]
