#!/usr/bin/env bash
set -e

# Install Hex and Rebar (build tools for Elixir dependencies)
mix local.hex --force
mix local.rebar --force

# Get and compile dependencies in prod mode
mix deps.get --only prod
MIX_ENV=prod mix deps.compile

# Build JS/CSS assets
npm install --prefix assets
npm run deploy --prefix assets

# Digest static assets
mix phx.digest

# Build the release
MIX_ENV=prod mix release
