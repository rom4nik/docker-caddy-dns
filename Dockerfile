FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:a51593964dcf5b43b549589e0e77d0dec7a1c3491fb5054a8e1e93e22505d1a6 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:9821d1ef822957bf0ac22f9c6e26ad6a3198604f29b3b79194acba7ccaff4532
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
