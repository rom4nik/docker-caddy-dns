FROM docker.io/library/caddy:2.6.4-builder-alpine@sha256:88c9dd9338a769b4c2d421f295eb3cb15fa2434e78c5628fa691f74f73a86072 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.6.4-alpine@sha256:d4ca216d8dc515a49bc20fa22a449283ade6c8fc132eb6fa412ff351664d4917
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
