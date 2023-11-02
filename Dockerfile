FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:e93dfafe0e8e55d032f3728f5cb1083a5fe162b884531b87c7e353ac210cc502 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:f1c092da9fcba7a8197cf1065a347d4f0bb67b6dd188985eafaf0a5aec6c9041
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
