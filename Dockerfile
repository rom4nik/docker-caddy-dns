FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:523edcf3099b5029d8c46407446688a691aca7b9faf5e415c752dd995817c81e AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:b6f72113f4565450be796b727c971cd9a863f06af987c6521fbe403028de93da
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
