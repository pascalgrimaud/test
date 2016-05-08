FROM jhipster/jhipster:v3.2.0

COPY tester.sh /home/jhipster/tester.sh
COPY configstore /home/jhipster/.config/configstore

USER root
RUN \
  chmod +x /home/jhipster/tester.sh && \
  chown -R jhipster:jhipster /home/jhipster

USER jhipster
VOLUME /tmp
RUN node -v
RUN npm -v
CMD /home/jhipster/tester.sh
