FROM elixir:1.13-alpine

RUN mix local.hex --force &&\
  mix local.rebar --force

COPY . /opt
WORKDIR /opt
ENV MIX_ENV=dev PORT=5000

EXPOSE 4000
CMD ["sh", "-c", "mix do ecto.create, ecto.migrate; mix phx.server"]
