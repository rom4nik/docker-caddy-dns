FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:ac31c0d2d6e482ceb3040d3711774a505d4e2136e8e2f2d879cbdd88575d027f AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:9821d1ef822957bf0ac22f9c6e26ad6a3198604f29b3b79194acba7ccaff4532
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
