FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:23019a6fc44b216b566efd7431a30e8a0e11470fb99e2ed49127c4942dd4c0af AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:eabac2898cf9fc7dc94d3fb03ac84c9c923aa6cc6f04874937d2f525e0d2f006
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
