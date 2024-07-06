#!/usr/bin/env bash

get_certificate_in_its_file(){
  SERVER=$1
  echo $SERVER
  echo \
   | openssl s_client -showcerts -servername "${SERVER}" -connect "${SERVER}":443 2>/dev/null \
   | openssl x509 -outform pem \
   > "${SERVER}.crt"
}

add_server_certificate_to_keystore(){
  SERVER=$1
  KEYSTORE=$2
  KEYPASS=$3
  keytool -importcert \
    -keystore "${KEYSTORE}" \
    -storepass "${KEYPASS}" \
    -noprompt \
    -file "${SERVER}.crt" \
    -alias "${SERVER}"
}

KEYSTORE=trust.jks
KEYPASS=TrustIt!
echo "Delete keystore \"${KEYSTORE}\" when exists"
rm "${KEYSTORE}"

get_certificate_in_its_file git.maisonsdumonde.net
add_server_certificate_to_keystore git.maisonsdumonde.net "${KEYSTORE}" "${KEYPASS}"

get_certificate_in_its_file artifactory01.siege.xm
add_server_certificate_to_keystore artifactory01.siege.xm "${KEYSTORE}" "${KEYPASS}"

get_certificate_in_its_file repo.maven.apache.org
add_server_certificate_to_keystore repo.maven.apache.org "${KEYSTORE}" "${KEYPASS}"

get_certificate_in_its_file registry.quarkus.io
add_server_certificate_to_keystore registry.quarkus.io "${KEYSTORE}" "${KEYPASS}"

cat <<__EOF__ | xargs echo
MAVEN_OPTS=-Djavax.net.ssl.trustStore=${KEYSTORE} -Djavax.net.ssl.trustStorePassword=${KEYPASS}
__EOF__
