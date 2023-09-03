FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:a42356bf71b38af49958c7dc25674a4fc174b597d8d96358c0e3e90227f345a3 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:733fe94133c4bd22c6ee8f9b9802bce8fede5e7b766bebde205a45dd4ac04aea
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
