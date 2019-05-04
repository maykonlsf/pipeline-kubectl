FROM alpine:3.9

RUN apk add --no-cache libintl && \
    apk add --no-cache --virtual build_deps gettext && \
    cp /usr/bin/envsubst /usr/local/bin/ && \
    apk del build_deps

RUN wget https://storage.googleapis.com/kubernetes-release/release/v1.14.1/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /bin

CMD ["/bin/sh"]

