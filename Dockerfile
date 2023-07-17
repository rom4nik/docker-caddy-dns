FROM docker.io/library/caddy:2.6.4-builder-alpine@sha256:045c42bf437d1299a92cb1d236cb7eff143ad57fb0bcbf542918eba7c1231e4e AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.6.4-alpine@sha256:d4ca216d8dc515a49bc20fa22a449283ade6c8fc132eb6fa412ff351664d4917
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
