FROM jboss/keycloak:3.4.3.Final

ENV DB_VENDOR POSTGRES

COPY ./themes/Leanda /opt/jboss/keycloak/themes/Leanda

RUN mkdir -p settings
COPY keycloak-settings/leanda-realm.json ./settings

CMD ["-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-Dkeycloak.import=settings/leanda-realm.json"]
