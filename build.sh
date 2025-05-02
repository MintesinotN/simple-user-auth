#!/usr/bin/env bash
set -e

mix local.hex --force
mix local.rebar --force

mix deps.get --only prod
MIX_ENV=prod mix deps.compile

npm install --prefix assets
npm run deploy --prefix assets
mix phx.digest

MIX_ENV=prod mix release
