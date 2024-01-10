FROM siptg/worker:latest

RUN apt-get update && apt-get install -y \
        supervisor \
        nginx \
    && rm -rf /var/lib/apt/lists/* \
    && ln -s /etc/yate/ssl /etc/nginx/ssl

COPY worker/nginx/nginx.conf /etc/nginx/nginx.conf

RUN echo "include /etc/nginx/modules-enabled/*.conf;" | cat - /etc/nginx/nginx.conf > /etc/nginx/nginx.conf.tmp && \
    mv /etc/nginx/nginx.conf.tmp /etc/nginx/nginx.conf

COPY supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY worker/yate/conf/ /etc/yate-config/ 
COPY run.sh /

VOLUME "/config"

ENTRYPOINT [ "/run.sh" ]

CMD ["/usr/bin/supervisord"]