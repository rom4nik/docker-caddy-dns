FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:0f9f34e8abc7c48e515fe57abf4ec6bc4891313a9fb636d0aa502dcaded30b5f AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:f1c092da9fcba7a8197cf1065a347d4f0bb67b6dd188985eafaf0a5aec6c9041
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
