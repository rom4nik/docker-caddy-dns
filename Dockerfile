FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:8308bb619e5ff5bc1842b8fc8480bb1584220a0c241f125727fa844918aac505 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:dda81a416214d4dbdd978810efa19643e39b626fe0f979558fbb116758784c89
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
