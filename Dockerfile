FROM elixir:1.8-alpine

ADD . /app
WORKDIR /app

RUN apk add inotify-tools

RUN mix local.hex --force
RUN mix deps.get

ENTRYPOINT ["mix", "phx.server"]

EXPOSE 4000