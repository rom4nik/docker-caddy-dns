FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:481c3357e533d892e2621d69ce3747a459e40af2f56159bcbd64b38bee1aa5bd AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:95ce04978787e23e35143d23b8af2fbb6d6de55213b54a2e9ed2dbf8ffe7313c
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
