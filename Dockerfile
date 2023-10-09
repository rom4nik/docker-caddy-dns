FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:9d7b7ac52c65e0e03d0426d74746e36c188ddaefbd5e79d39824cf4c21eb4165 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:11ae052d9015105757d19caf86dc51fc14403841f2b65e93fe320f4d0e197385
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
