ARG CADDY_BASE_TAG=builder-alpine
FROM caddy/caddy:${CADDY_BASE_TAG} AS builder

RUN xcaddy build \
   --output /usr/bin/caddy \
   --with github.com/greenpau/caddy-security \
   --with github.com/corazawaf/coraza-caddy/v2

FROM caddy/caddy:alpine
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
