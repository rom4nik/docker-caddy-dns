FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:54780828445900cfb0d02bd750da498d29795c39321afb7d2b6add47f936daa7 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:95ce04978787e23e35143d23b8af2fbb6d6de55213b54a2e9ed2dbf8ffe7313c
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
