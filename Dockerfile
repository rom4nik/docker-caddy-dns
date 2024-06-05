FROM docker.io/library/caddy:2.8.4-builder-alpine@sha256:cdf3364f8cb02338b857728fdc0a9b8875b343996db347300bf2361db3da9094 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.8.4-alpine@sha256:a48e22edad925dc216fd27aa4f04ec49ebdad9b64c9e5a3f1826d0595ef2993c
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
