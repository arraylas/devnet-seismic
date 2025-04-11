# Seismic Devnet Auto Installer

This repo by [arraylas](https://github.com/arraylas) provides a **simple, automated setup** for the Seismic Foundry devnet.  
Run `setup.sh` to install all dependencies, configure Rust and Seismic CLI, and deploy a smart contract.

<p align="center">
  <a href="https://x.com/mikicatsman">
    <img src="https://img.shields.io/badge/X-@mikicatsman-1DA1F2?style=flat&logo=twitter&logoColor=white" alt="Follow on X">
  </a>
</p>

---

## Features

- Installs Rust and Seismic CLI (`sfoundryup`)
- Installs Bun.js and executes a transaction script
- Sets up required system packages
- Clones the `try-devnet` repo from SeismicSystems
- Deploys an example smart contract
- Skips already installed components

---

## Usage

### 1. Clone the repository

```bash
git clone https://github.com/arraylas/devnet-seismic.git
cd devnet-seismic
```

### 2. Make the script executable

```bash
chmod +x setup.sh
```

### 3. Run the script

```bash
./setup.sh
```

---

## Script Breakdown

- System Update & Dependency Install
- Rust Installation (if not already installed)
- jq Check
- Install Seismic CLI (`sfoundryup`)
- Clone Seismic `try-devnet` repo
- Deploy smart contract
- Install Bun.js runtime
- Run transaction example with Bun

---

## Seismic Devnet Configuration

**Network Name:** Seismic devnet  
**Currency Symbol:** ETH  
**Chain ID:** 5124  
**RPC URL (HTTP):** https://node-2.seismicdev.net/rpc  
**RPC URL (WebSocket):** wss://node-2.seismicdev.net/ws  
**Explorer:** [https://explorer-2.seismicdev.net](https://explorer-2.seismicdev.net)  
**Faucet:** [https://faucet-2.seismicdev.net](https://faucet-2.seismicdev.net)  
**Starter Repo:** [Seismic Starter](https://github.com/SeismicSystems/seismic-starter)

---

## Additional Bun Setup (Included in `setup.sh`)

```bash
curl -fsSL https://bun.sh/install | bash
source ~/.bashrc
bun --version
cd ../cli/
bun install
bash script/transact.sh
```

This will execute a basic transaction script after deploying the contract.

---

## Notes

- `sfoundryup` can take **5–20 minutes**.
- If tools or folders already exist, they will **not be overwritten**.
- Recommended on clean Ubuntu VPS with available disk space.

---

## Troubleshooting

### No space left on device?
Free up space with:

```bash
sudo docker system prune -af
sudo apt clean
sudo rm -rf /tmp/*
```

### Permission denied?
Make sure the script is executable:

```bash
chmod +x setup.sh
```

---

## Author

**GitHub:** [arraylas](https://github.com/arraylas)  
**X (Twitter):** [@mikicatsman](https://x.com/mikicatsman)

---

## License

MIT © arraylas

