FROM jboss/keycloak:11.0.3

ENV DB_VENDOR POSTGRES

COPY ./themes/OSDR /opt/jboss/keycloak/themes/OSDR

COPY keycloak-settings/osdr-realm.json ./settings/
COPY keycloak-settings/leanda-realm.json ./settings/
COPY keycloak-settings/ez-assets-realm.json ./settings/

CMD ["-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-Dkeycloak.import=settings/osdr-realm.json,settings/leanda-realm.json,settings/ez-assets-realm.json"]