# dehydrated-cloudflare
Docker for dehydrated with a Cloudflare hook

Working on the hook script in pure bash - No python/lexicon

references:  
* https://github.com/BotoX/dehydrated-cloudflare-hook/tree/master  
* https://github.com/socram8888/dehydrated-hook-cloudflare  
* https://github.com/confor/dehydrated-cloudflare-hook  

file permissions:  
* hooks.sh should be executable - `chmod +x hooks.sh`  
* dehydrated-crontab needs - `chmod 0644 dehydrated-crontab`

## Create the below files

dehydrated/configs.d/<config.sh>
```
IP_VERSION=4
CA="letsencrypt-test"
CHALLENGETYPE="dns-01"
HOOK="${BASEDIR}/hooks.sh"
CONTACT_EMAIL="email@domain.tld"
```

dehydrated/domains.txt.d/<domain.tld.txt>
```
domain.tld sub.domain.tld
```

## Compose Changes
At most, may need to update your network bindings to expose it
```
ports:
  - <IP Address / e.g. - 192.168.0.2>:80/tcp
```

## Build and Run
`docker build . -t dehydrated-cloudflare:latest`  
`docker compose up -d`

## Dehydrated Notes
https://github.com/dehydrated-io/dehydrated  

Dehydrated needs - bash, curl & openssl to run