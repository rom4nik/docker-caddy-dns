FROM docker.io/library/caddy:2.7.2-builder-alpine@sha256:ed3edcff66072654c60998ef8ff764598573b8ecfad732ba7988a01d6d9b2dfe AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.2-alpine@sha256:5eb52d854b03fed68136a58636afb03f641d152abd2749e4ad9839fbad50c3c2
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
