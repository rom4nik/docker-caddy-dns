FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:481c3357e533d892e2621d69ce3747a459e40af2f56159bcbd64b38bee1aa5bd AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:2e1d4592f1718bb47645da5a83a846fe19094f18e6c921fdf56d174f05c63213
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
