FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:523edcf3099b5029d8c46407446688a691aca7b9faf5e415c752dd995817c81e AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:a6da3a5344175003538ac1cf4ec8a79ef48d525c0841e9cc81a5c0112d52c982
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
