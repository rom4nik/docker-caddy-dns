FROM docker.io/library/caddy:2.7.4-builder-alpine@sha256:43c5546a66c80f9849eba0fcd513efa91d044b4a0bed30db8602df07a8a66ef2 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.4-alpine@sha256:a4b2a603c5f188268fa63c56b000e6198508f290789d811e237e07d99dddc28d
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
