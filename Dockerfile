FROM docker.io/library/caddy:2.7.2-builder-alpine@sha256:ed3edcff66072654c60998ef8ff764598573b8ecfad732ba7988a01d6d9b2dfe AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.2-alpine@sha256:19f88d98fda45c99e4880b262cd4e36ebfdb9c88b628058102ab6059a0bc5c39
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
