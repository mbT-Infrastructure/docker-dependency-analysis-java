FROM madebytimo/scripts AS downloader

WORKDIR /app
COPY crda-download.sh .
RUN ./crda-download.sh


FROM madebytimo/java-maven

COPY --from=downloader /app/crda.deb .
RUN apt install -y -qq ./crda.deb && \
    rm crda.deb

COPY analyze.sh /usr/local/bin

ENV CRDA_CONSENT_TELEMETRY="false"
ENV CRDA_KEY=""
ENV CRDA_SNYK_TOKEN=""

WORKDIR /media/workdir

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "analyze.sh" ]
