FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:e48893eec1bcee7071e85f953e894b52d7d99317e159eafb7f1259e6bc858d5b AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:dda81a416214d4dbdd978810efa19643e39b626fe0f979558fbb116758784c89
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
