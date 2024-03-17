FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:fd9d8fc07ef53ffdb2c55e5eaf90f575f0742a80eca6a85d28000ae766838cc2 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:dda81a416214d4dbdd978810efa19643e39b626fe0f979558fbb116758784c89
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
