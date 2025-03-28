#!/usr/bin/env bash

apt update
apt install -y curl
curl -L -O https://github.com/exercism/cli/releases/download/v3.5.4/exercism-3.5.4-linux-x86_64.tar.gz
tar -xf exercism-3.5.4-linux-x86_64.tar.gz
mkdir -p ~/bin
mv exercism ~/bin
~/bin/exercism version
~/bin/exercism configure --token="$EXERCISM_API" --workspace=/github/workspace
~/bin/exercism submit ruby/"$EXERCISE_PATH"/"$EXERCISE_NAME".rb

