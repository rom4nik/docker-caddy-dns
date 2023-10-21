FROM docker.io/library/caddy:2.7.5-builder-alpine@sha256:3d482903f0f756e70ee3a87f506c31d6489b284d615034855593a3519b8737ba AS builder
RUN xcaddy build \
	--with github.com/caddy-dns/cloudflare \
	--with github.com/caddy-dns/ovh

FROM docker.io/library/caddy:2.7.5-alpine@sha256:f1c092da9fcba7a8197cf1065a347d4f0bb67b6dd188985eafaf0a5aec6c9041
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
