FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:10f94f40c94c6c9499c7753f9d0b85d59ae4f3cfa8e9484e267ff3d7ca231e9f AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:733fe94133c4bd22c6ee8f9b9802bce8fede5e7b766bebde205a45dd4ac04aea
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
