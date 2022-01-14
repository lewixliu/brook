From alpine:latest

ARG VERSION=v20210701

ENV TZ=Asia/Shanghai

RUN apk add -U tzdata \
    && wget --no-check-certificate -O /usr/bin/brook "https://github.com/txthinking/brook/releases/download/${VERSION}/brook_linux_amd64" \
    && chmod +x /usr/bin/brook

ENV OPTIONS="-d"
ENV COMMAND="server"
ENV ARGUMENTS="--listen :9999 --password hello"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"] 
