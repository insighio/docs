FROM klakegg/hugo:0.74.3-alpine as build-stage
RUN apk --no-cache add git
COPY ./ /app
WORKDIR /app
RUN git submodule update --init --recursive
RUN hugo

FROM nginx as production-stage
RUN mkdir /app
COPY --from=build-stage /app/public /app
COPY docker/nginx.conf /etc/nginx/conf.d/default.conf
COPY docker/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

