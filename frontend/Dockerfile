FROM kube-registry.kube-system.svc.cluster.local:5000/ruby-phonebook:a34121390db3
MAINTAINER Christoph Lukas <christoph.lukas@gmx.net>

ENV DEBIAN_FRONTEND noninteractive
ARG ARTEFACT_URL
ENV ARTEFACT_FILE $(basename $ARTEFACT_URL)

RUN wget -q -O "/tmp/$ARTEFACT_FILE" "$ARTEFACT_URL"
RUN \
  dpkg -i "/tmp/$ARTEFACT_FILE" && rm -f "/tmp/$ARTEFACT_FILE"

COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
