FROM n8nio/n8n:latest
USER root
RUN wget -q https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && \
    tar xf ffmpeg-release-amd64-static.tar.xz && \
    mv ffmpeg-*-amd64-static/ffmpeg /usr/local/bin/ && \
    mv ffmpeg-*-amd64-static/ffprobe /usr/local/bin/ && \
    rm -rf ffmpeg* && \
    mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n
USER node
