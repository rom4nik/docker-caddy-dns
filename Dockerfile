FROM docker.io/library/caddy:2.6.3-builder-alpine AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.6.3-alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
