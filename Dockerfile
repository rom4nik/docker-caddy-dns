FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:a42356bf71b38af49958c7dc25674a4fc174b597d8d96358c0e3e90227f345a3 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:7e01c08308bc94c1ef3e495f0b2ba469d1f7e8d1a4f2caa2fbe189edf48866a6
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
