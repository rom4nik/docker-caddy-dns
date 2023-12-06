FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:3e0232193d2e16a551210bb7cf4da86b6d0bf45cb70508c343c680065d7c440e AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:9821d1ef822957bf0ac22f9c6e26ad6a3198604f29b3b79194acba7ccaff4532
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
