FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:308ffbaa017c0bb533cfe7442c49460b33193a43192b2bb9744a0fa7080a50c3 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:a4b2a603c5f188268fa63c56b000e6198508f290789d811e237e07d99dddc28d
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
