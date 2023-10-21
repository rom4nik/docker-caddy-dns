FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:65b9985ff0eb0aed8c0c3aec76d749d1e8854df17ddf3c0b300057a35976b631 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:841fbf8813b069e5b6765ec6d71f08227dabb7f24cad9f8b54eaa836b3a3abc5
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
