#!/usr/bin/env bash

BASE_HOME=/Users/gniu/Oracle/mw12c/user_projects/utils/wls-adminport
DOMAIN_HOME=/Users/gniu/Oracle/mw12c/user_projects/domains/base_domain

source $DOMAIN_HOME/bin/setDomainEnv.sh

SSL_HOME=$BASE_HOME/ssl
APPS_HOME=$BASE_HOME/apps

ADMIN_URL=t3s://localhost:9002

JVM_ARGS="-Dweblogic.security.allowCryptoJDefaultJCEVerification=true -Dweblogic.security.SSL.ignoreHostnameVerification=true -Dweblogic.security.allowCryptoJDefaultPRNG=true -Dweblogic.security.TrustKeyStore=CustomTrust -Dweblogic.security.CustomTrustKeyStoreFileName=$SSL_HOME/TrustMyOwnSelf.jks -Dweblogic.security.CustomTrustKeyStoreType=jks -Dweblogic.security.CustomTrustKeyStorePassPhrase=trustpass"

