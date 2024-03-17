FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:e48893eec1bcee7071e85f953e894b52d7d99317e159eafb7f1259e6bc858d5b AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:95ce04978787e23e35143d23b8af2fbb6d6de55213b54a2e9ed2dbf8ffe7313c
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
