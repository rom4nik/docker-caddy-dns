FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:69e269256f3c0a24e47b8c7fbef7c720cb6b1d3473939b404e6b52743f2db504 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:eabac2898cf9fc7dc94d3fb03ac84c9c923aa6cc6f04874937d2f525e0d2f006
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
