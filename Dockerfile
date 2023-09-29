FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:ff77902e05cee4e277238e37e31ffde9f524de1e4f214fb9044e4a80e477cabf AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:a4b2a603c5f188268fa63c56b000e6198508f290789d811e237e07d99dddc28d
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
