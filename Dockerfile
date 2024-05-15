FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:1bd8cac07af2bd33d70ca237e3fa5324af77ff08d2868e890ef971eb2c9222b9 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:2e1d4592f1718bb47645da5a83a846fe19094f18e6c921fdf56d174f05c63213
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
