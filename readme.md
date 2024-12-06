Format the code
forge fmt

fork main net
forge test --fork url <main-net-endpoint> --match-contract Fork -vvv
forge test --fork-url https://eth-mainnet.g.alchemy.com/v2/nPL494gIDwtmnlSo7nqFNvfgf7nlzh6e --match-contract Whale -vvv

------
DEPLOYING A CONTRACT
copy env variables to stack
source .env
forge script script/Token.s.sol:TokenScript

simulate deployment
forge script script/Token.s.sol:TokenScript --rpc-url $SEPOLIA_RPC

deploy to sepolia and verify contract
forge script script/Token.s.sol:TokenScript --rpc-url $SEPOLIA_RPC --broadcast --verify -vvvv

inspect state variables/functions/interface
forge inspect src/ocean/Ocean.sol:Ocean storage --pretty
forge inspect src/ocean/Ocean.sol:Ocean methods --pretty
forge inspect src/ocean/Ocean.sol:Ocean abi --pretty > temp.sol