#!/usr/bin/env bash

tld_domain() {
    local DOMAIN="${1}"
    echo $(echo "$DOMAIN" | awk -F'.' '{gsub("http://|/.*","")} NF>2{$1="";$0=substr($0, 2)}1' OFS='.')
}

deploy_challenge() {
  local DOMAIN="${1}" TOKEN_FILENAME="${2}" TOKEN_VALUE="${3}"

  TLD_DOMAIN=$(tld_domain $DOMAIN)
  
}

clean_challenge() {
  local DOMAIN="${1}" TOKEN_FILENAME="${2}" TOKEN_VALUE="${3}"

  TLD_DOMAIN=$(tld_domain $DOMAIN)
  
}

sync_cert() {
  local KEYFILE="${1}" CERTFILE="${2}" FULLCHAINFILE="${3}" CHAINFILE="${4}" REQUESTFILE="${5}"
}

deploy_cert() {
  local DOMAIN="${1}" KEYFILE="${2}" CERTFILE="${3}" FULLCHAINFILE="${4}" CHAINFILE="${5}" TIMESTAMP="${6}"
}

deploy_ocsp() {
  local DOMAIN="${1}" OCSPFILE="${2}" TIMESTAMP="${3}"
}


unchanged_cert() {
  local DOMAIN="${1}" KEYFILE="${2}" CERTFILE="${3}" FULLCHAINFILE="${4}" CHAINFILE="${5}"
}

invalid_challenge() {
  local DOMAIN="${1}" RESPONSE="${2}"
}

request_failure() {
  local STATUSCODE="${1}" REASON="${2}" REQTYPE="${3}" HEADERS="${4}"
}

generate_csr() {
  local DOMAIN="${1}" CERTDIR="${2}" ALTNAMES="${3}"
}

startup_hook() {
  :
}

exit_hook() {
  local ERROR="${1:-}"
}

HANDLER="${1}"; shift
if [[ "${HANDLER}" =~ ^(deploy_challenge|clean_challenge|sync_cert|deploy_cert|deploy_ocsp|unchanged_cert|invalid_challenge|request_failure|generate_csr|startup_hook|exit_hook)$ ]]; then
  "$HANDLER" "$@"
fi