FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:a51593964dcf5b43b549589e0e77d0dec7a1c3491fb5054a8e1e93e22505d1a6 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:f1c092da9fcba7a8197cf1065a347d4f0bb67b6dd188985eafaf0a5aec6c9041
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
