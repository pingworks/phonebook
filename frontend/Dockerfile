FROM ruby-phonebook:2.2
MAINTAINER Christoph Lukas <christoph.lukas@gmx.net>

ENV DEBIAN_FRONTEND noninteractive

RUN ARTEFACT_FILE=$(basename $ARTEFACT_URL); wget -O "/tmp/$ARTEFACT_FILE" "$ARTEFACT_URL"
RUN \
  dpkg -i "/tmp/$ARTEFACT_FILE" && rm -f "/tmp/$ARTEFACT_FILE"

COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
