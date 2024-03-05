FROM docker.io/library/caddy:2.7.6-builder-alpine@sha256:87635260bd514d4be319457066f9dcc73ad763bdda83bc7edeb6e8db9f961374 AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.6-alpine@sha256:80ca561981768b2c3568cc4bef3d4cd1f11c2a625c806bedeb8453aef98779a0
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
