FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:ff77902e05cee4e277238e37e31ffde9f524de1e4f214fb9044e4a80e477cabf AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:7e01c08308bc94c1ef3e495f0b2ba469d1f7e8d1a4f2caa2fbe189edf48866a6
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
