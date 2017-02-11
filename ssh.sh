#!/usr/bin/env bash

source ./common.sh

# cleanup
rm -rf $SSL_HOME/*MyOwn*
cd $SSL_HOME

java utils.CertGen -selfsigned -certfile MyOwnSelfCA.cer -keyfile MyOwnSelfKey.key -keyfilepass mykeypass -cn "My Own Self CA" -keyusagecritical false -keyusage digitalSignature,keyEncipherment

java utils.ImportPrivateKey -keystore MyOwnIdentityStore.jks -storepass identitypass -keypass keypassword -alias trustself -certfile MyOwnSelfCA.cer.pem -keyfile MyOwnSelfKey.key.pem -keyfilepass mykeypass
echo "trustpass
trustpass
y" | keytool -import -trustcacerts -alias trustself -keystore TrustMyOwnSelf.jks -file MyOwnSelfCA.cer.der -keyalg RSA


cat <<EOT
identity store password: identitypass
identity store path: $SSL_HOME/MyOwnIdentityStore.jks

trust store password: trustpass
trust store path: $SSL_HOME/TrustMyOwnSelf.jks

trust alias: trustself
trust cert password: keypassword
EOT


         