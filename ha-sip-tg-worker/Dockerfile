FROM siptg/worker:latest

COPY worker/yate/conf/ /etc/yate-config/ 
COPY run.sh /

VOLUME "/config"

ENTRYPOINT [ "/run.sh" ]

CMD [ "yate" ]