FROM docker.io/library/caddy:2.6.4-builder-alpine@sha256:bbe9f7e2106c8954433b179563da0124860629d757c0eb85c1a37cb91e4dab0b AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.6.4-alpine@sha256:5acae6b87b26a591d6d14ec2704b7f2cd94b888ad62af16a02356d3124198ede
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
