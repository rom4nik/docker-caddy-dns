# docker-caddy-dns

Docker image containing [Caddy reverse proxy](https://caddyserver.com/) built with addition of [Cloudflare](https://github.com/caddy-dns/cloudflare) and [OVH](https://github.com/caddy-dns/ovh) DNS provider modules.

Renovate and GitHub Actions are used to ensure quick updates when upstream releases a new version.

## How to use
Follow [documentation](https://hub.docker.com/_/caddy) for official Docker image, replacing `caddy:<version>` with `ghcr.io/rom4nik/docker-caddy-dns:<version>` (or `:latest`). While writing Caddyfile, enable the DNS challenge by following [those steps](https://caddy.community/t/how-to-use-dns-provider-modules-in-caddy-2/8148#enabling-the-dns-challenge-5).
