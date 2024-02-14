FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:33a92d10027f0a21785908d646f81c6c23b4abd130fc123200f00a9381693be9 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:80ca561981768b2c3568cc4bef3d4cd1f11c2a625c806bedeb8453aef98779a0
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
