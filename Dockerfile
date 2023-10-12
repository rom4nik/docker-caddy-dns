FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:5eb7fee912aafef316ffeff206621c8ee11c12087512a0be0d301f39820dcb71 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:a6da3a5344175003538ac1cf4ec8a79ef48d525c0841e9cc81a5c0112d52c982
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
