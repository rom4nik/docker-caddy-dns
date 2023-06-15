FROM docker.io/library/caddy:2.6.4-builder-alpine@sha256:457bbe3a859c040e764e75c181e7156a18290bfdbbb24c22a43e749ec7aa7061 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.6.4-alpine@sha256:5acae6b87b26a591d6d14ec2704b7f2cd94b888ad62af16a02356d3124198ede
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
