FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:308ffbaa017c0bb533cfe7442c49460b33193a43192b2bb9744a0fa7080a50c3 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:11ae052d9015105757d19caf86dc51fc14403841f2b65e93fe320f4d0e197385
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
