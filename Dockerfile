FROM docker.io/library/caddy:2.6.4-builder-alpine@sha256:0458a6633430f81251ddd89d9224edcd9d2f55c937673d9fbb68c76132d3e82b AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.6.4-alpine@sha256:d4ca216d8dc515a49bc20fa22a449283ade6c8fc132eb6fa412ff351664d4917
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
