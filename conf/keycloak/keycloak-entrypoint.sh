#!/bin/bash

echo $CHE_REDIRECT_URIS $CHE_WEB_ORIGINS
mkdir /opt/jboss/keycloak/realms/
sed -e s#CHE_REDIRECT_URIS#$CHE_REDIRECT_URIS#g -e s#CHE_WEB_ORIGINS#$CHE_WEB_ORIGINS#g -e s#LDAP_BASE_DN#$LDAP_BASE_DN#g -e s#LDAP_PASSWORD#$LDAP_PASSWORD#g /tmp/keycloak/che/1c-realm.json > /opt/jboss/keycloak/realms/1c-realm.json
cp /tmp/keycloak/che/1c-users-0.json /opt/jboss/keycloak/realms/1c-users-0.json
cp /tmp/keycloak/che/master-realm.json /opt/jboss/keycloak/realms/master-realm.json
cp /tmp/keycloak/che/master-users-0.json /opt/jboss/keycloak/realms/master-users-0.json

if [ $KEYCLOAK_USER ] && [ $KEYCLOAK_PASSWORD ]; then
    keycloak/bin/add-user-keycloak.sh --user $KEYCLOAK_USER --password $KEYCLOAK_PASSWORD
fi

if [ "$DB_VENDOR" == "POSTGRES" ]; then
  databaseToInstall="postgres"
elif [ "$DB_VENDOR" == "MYSQL" ]; then
  databaseToInstall="mysql"
elif [ "$DB_VENDOR" == "H2" ]; then
  databaseToInstall=""
else
    if (printenv | grep '^POSTGRES_' &>/dev/null); then
      databaseToInstall="postgres"
    elif (printenv | grep '^MYSQL_' &>/dev/null); then
      databaseToInstall="mysql"
    fi
fi

if [ "$databaseToInstall" != "" ]; then
    echo "[KEYCLOAK DOCKER IMAGE] Using the external $databaseToInstall database"
    /bin/sh /opt/jboss/keycloak/bin/change-database.sh $databaseToInstall
else
    echo "[KEYCLOAK DOCKER IMAGE] Using the embedded H2 database"
fi

exec /opt/jboss/keycloak/bin/standalone.sh $@
exit $?

