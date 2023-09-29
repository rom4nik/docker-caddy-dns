FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:43c5546a66c80f9849eba0fcd513efa91d044b4a0bed30db8602df07a8a66ef2 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:7e01c08308bc94c1ef3e495f0b2ba469d1f7e8d1a4f2caa2fbe189edf48866a6
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
