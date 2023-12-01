FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:0f9f34e8abc7c48e515fe57abf4ec6bc4891313a9fb636d0aa502dcaded30b5f AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:9821d1ef822957bf0ac22f9c6e26ad6a3198604f29b3b79194acba7ccaff4532
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
