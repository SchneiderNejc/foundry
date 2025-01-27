# Foundry Training Walkthrough

---

## **Forge Commands**

### Formatting Code

Run the formatter to ensure consistent code style:

```sh
`forge fmt`
```

### Fork Mainnet

Testing contracts with mainnet forking:

```sh
forge test --fork url --match-contract Fork -vvv
forge test --fork-url https://eth-mainnet.g.alchemy.com/v2/nPL494gIDwtmnlSo7nqFNvfgf7nlzh6e --match-contract Whale -vvv
```

### Deploying a Contract

copy env variables to stack

```sh
source .env
forge script script/Token.s.sol:TokenScript
```

simulate deployment

```sh
forge script script/Token.s.sol:TokenScript --rpc-url $SEPOLIA_RPC
```

deploy to sepolia and verify contract

```sh
forge script script/Token.s.sol:TokenScript --rpc-url $SEPOLIA_RPC --broadcast --verify -vvvv
```

inspect state variables/functions/interface

```sh
forge inspect src/ocean/Ocean.sol:Ocean storage --pretty forge inspect src/ocean/Ocean.sol:Ocean methods --pretty
forge inspect src/ocean/Ocean.sol:Ocean abi --pretty > temp.sol
```

---

## **Cast Commands**

### Wallet Management

- Create a new wallet

```sh
cast wallet import wallet1 --private-key $PRIVATE_KEY
```

- List wallets

```sh
cast wallet list
```

- Remove a wallet

```sh
remove wallet rm -rf ~/.foundry/keystores/wallet1
```

### Interaction with Contracts

- Set Address for Interaction

```sh
DST=<address>
```

- Set Function Signature

```sh
FUNC_SIG="set(uint256)"
```

- Set Arguments

```sh
ARGS="888"
```

- RPC Configuration

```sh
RPC=<infura_rpc>
```

- Send a Transaction

```sh
cast send --account wallet1 --rpc-url $RPCD $DST $FUNC_SIG $ARGS
```

- Call a Contract Function

```sh
cast call --rpc-url $RPC $DST "val()(uint256)"
```

---

## Sources

This repository and walkthrough are intended for training purposes only. The original repository and video walkthrough can be found below:

- **Original Repo**: [hello-foundry on GitHub](https://github.com/t4sk/hello-foundry)
- **Video Walkthrough**: [YouTube Playlist](https://www.youtube.com/watch?v=tgs5q-GJmg4&list=PLO5VPQH6OWdUrKEWPF07CSuVm3T99DQki)

The methodology used stems from best practices, as demonstrated at Solidity-by-example.

- **Initial lessons**: [solidity-by-example](https://solidity-by-example.org/)

The associated repository for this training:

- [Foundry Training Repository](https://github.com/SchneiderNejc/foundry-training)
