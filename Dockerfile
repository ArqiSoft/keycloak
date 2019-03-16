FROM jboss/keycloak:4.8.3.Final

#ENV DB_VENDOR POSTGRES

COPY ./themes/OSDR /opt/jboss/keycloak/themes/OSDR

RUN mkdir -p settings
COPY keycloak-settings/osdr-realm.json ./settings

CMD ["-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-Dkeycloak.import=settings/osdr-realm.json"]