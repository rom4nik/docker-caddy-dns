FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:5eb7fee912aafef316ffeff206621c8ee11c12087512a0be0d301f39820dcb71 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:b6f72113f4565450be796b727c971cd9a863f06af987c6521fbe403028de93da
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
