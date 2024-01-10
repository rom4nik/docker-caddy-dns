FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:2cc3adbbf1d2a62a983a23823d00a3d5ad83560344fe3a78f0cbdc38e1b606ca AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:eabac2898cf9fc7dc94d3fb03ac84c9c923aa6cc6f04874937d2f525e0d2f006
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
