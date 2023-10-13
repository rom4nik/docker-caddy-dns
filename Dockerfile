FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:5eb7fee912aafef316ffeff206621c8ee11c12087512a0be0d301f39820dcb71 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:841fbf8813b069e5b6765ec6d71f08227dabb7f24cad9f8b54eaa836b3a3abc5
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
