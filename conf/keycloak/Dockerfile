FROM jboss/keycloak-openshift:3.4.0.Final

COPY che /opt/jboss/keycloak/themes/che
COPY realms/template /tmp/keycloak/che
COPY keycloak-entrypoint.sh /opt/jboss/docker-entrypoint.sh
