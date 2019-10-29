# Keycloak repository

[![Build Status](https://travis-ci.org/ArqiSoft/keycloak.svg?branch=master)](https://travis-ci.org/ArqiSoft/keycloak)

It contains Leanda docker image and composes for environments: dev, test, uat, prod

## Keycloak theme

There is keycloak customized theme **osdr-theme** in folder **./themes**

## Initial keycloak settings

There is ./keycloak-settingsjson/osdr-realm.json file that contains OSDR keycloak base settings.
After image up it has

- realm - OSDR
- client - leanda-angular
- keycloak client has settings for connecting applications by oidc protocol

## To rum docker image standalone, just for test and experiments

NOTE: before run image standalone comment ENV DB_VENDOR POSTGRES

```terminal
docker build --tag keycloak-test .
docker run --rm -e KEYCLOAK_USER=admin -e KEYCLOAK_PASSWORD=admin -p 8080:8080 keycloak-test
```

## Run in docker compose

In order to run **Leanda** project locally you need to configure **keycloak** host on your local machine

### In Windows

Edit *c:\Windows\System32\Drivers\etc\hosts* file and add

```terminal
127.0.0.1 keycloak
```

so you can acess Keycloak using the URL http://keycloak:8080

### In Linux

## Links

[Keycloak github](https://github.com/keycloak/keycloak)

[Keycloak documentation](https://www.keycloak.org/documentation.html)
