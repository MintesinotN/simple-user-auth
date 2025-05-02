#!/bin/bash
mix deps.get
MIX_ENV=prod mix compile
npm --prefix assets install
npm run --prefix assets deploy
MIX_ENV=prod mix phx.digest
