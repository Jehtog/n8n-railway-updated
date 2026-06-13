FROM n8nio/n8n:latest
USER root

RUN wget https://gitlab.alpinelinux.org/api/v4/projects/5/packages/generic/v2.14.4/x86_64/apk.static -O /usr/local/bin/apk.static && \
    chmod +x /usr/local/bin/apk.static && \
    /usr/local/bin/apk.static -X http://dl-cdn.alpinelinux.org/alpine/v3.22/main -U --allow-untrusted --initdb add apk-tools && \
    apk add --no-cache ffmpeg su-exec && \
    printf '#!/bin/sh\nmkdir -p /home/node/.n8n\nchown -R node:node /home/node/.n8n\nexec su-exec node n8n\n' > /usr/local/bin/entrypoint.sh && \
    chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD []
