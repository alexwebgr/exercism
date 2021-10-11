#!/usr/bin/env bash

apt update
apt install -y curl
curl -L -O https://github.com/exercism/cli/releases/download/v3.0.13/exercism-linux-64bit.tgz
tar -xf exercism-linux-64bit.tgz
mkdir -p ~/bin
mv exercism ~/bin
~/bin/exercism version
~/bin/exercism configure --token="$EXERCISM_API" --workspace=/github/workspace
~/bin/exercism submit ruby/"$EXERCISE_PATH"/"$EXERCISE_NAME".rb

