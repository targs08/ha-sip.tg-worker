FROM siptg/worker:latest

RUN apt-get update && apt-get install -y \
        supervisor \
        nginx \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /etc/yate/ssl /etc/nginx/ssl

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY worker/yate/conf/ /etc/yate-config/ 
COPY run.sh /

VOLUME "/config"

ENTRYPOINT [ "/run.sh" ]

CMD ["/usr/bin/supervisord"]