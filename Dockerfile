FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:ec3ac7eee8b4635cb9336eb4cb201684d2cd54f6fe3bcbb61469e1114188f461 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:11ae052d9015105757d19caf86dc51fc14403841f2b65e93fe320f4d0e197385
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
