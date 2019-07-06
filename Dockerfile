FROM alpine:3.10

RUN apk add --no-cache libintl curl && \
    apk add --no-cache --virtual build_deps gettext && \
    cp /usr/bin/envsubst /usr/local/bin/ && \
    apk del build_deps

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.15.0/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /bin

CMD ["/bin/sh"]
