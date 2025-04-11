#!/bin/bash

set -euo pipefail

echo "---- [1/8] Updating system and installing dependencies ----"
sudo apt update && sudo apt upgrade -y

for pkg in curl git build-essential file unzip jq; do
    if ! dpkg -s "$pkg" >/dev/null 2>&1; then
        echo "Installing missing package: $pkg"
        sudo apt install -y "$pkg"
    else
        echo "Package already installed: $pkg"
    fi
done

echo "---- [2/8] Installing Rust (if missing) ----"
if ! command -v rustc >/dev/null 2>&1; then
    curl https://sh.rustup.rs -sSf | sh -s -- -y
    source "$HOME/.cargo/env"
else
    echo "Rust already installed: $(rustc --version)"
fi

echo "---- [3/8] Verifying jq ----"
jq --version

echo "---- [4/8] Installing sfoundryup (Seismic Foundry CLI) ----"
if ! command -v sfoundryup >/dev/null 2>&1; then
    curl -L \
         -H "Accept: application/vnd.github.v3.raw" \
         "https://api.github.com/repos/SeismicSystems/seismic-foundry/contents/sfoundryup/install?ref=seismic" | bash
    source ~/.bashrc
else
    echo "sfoundryup already installed."
fi

echo "---- [5/8] Running sfoundryup (this may take 5–20 minutes) ----"
sfoundryup

echo "---- [6/8] Cloning try-devnet repo ----"
if [ ! -d "try-devnet" ]; then
    git clone --recurse-submodules https://github.com/SeismicSystems/try-devnet.git
else
    echo "Repo 'try-devnet' already exists."
fi

echo "---- [7/8] Deploying smart contract ----"
cd try-devnet/packages/contract/
bash script/deploy.sh

echo "---- [✔] Setup and deployment complete! ----"
