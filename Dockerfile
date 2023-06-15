FROM docker.io/library/caddy:2.6.4-builder-alpine@sha256:457bbe3a859c040e764e75c181e7156a18290bfdbbb24c22a43e749ec7aa7061 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.6.4-alpine@sha256:d4ca216d8dc515a49bc20fa22a449283ade6c8fc132eb6fa412ff351664d4917
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
