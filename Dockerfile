FROM elixir:1.13-alpine

RUN mix local.hex --force &&\
  mix local.rebar --force &&\
  apk add inotify-tools

WORKDIR /opt

EXPOSE 4000
CMD ["sh", "-c", "mix do ecto.create, ecto.migrate; mix phx.server"]
