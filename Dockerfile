FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:7523c3640b0ca1124b94e71ffae7b2c09dfa9b0353c3cea4db37fe59bb20911b AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:eabac2898cf9fc7dc94d3fb03ac84c9c923aa6cc6f04874937d2f525e0d2f006
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
