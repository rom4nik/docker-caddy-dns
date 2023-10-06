FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:fce7dd2f5052b296f1724efe9c56a54b03b612a4dfb08be2c6750810517270c1 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:11ae052d9015105757d19caf86dc51fc14403841f2b65e93fe320f4d0e197385
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
