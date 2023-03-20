# Sample Hardhat Project

this task:
prepare the test case:
--only deployed owner can call the contract, other account address cannot call teh contract

npx hardhat run scripts/deploy.js --network goerli

verify the contract and opensource

npx hardhat verify 0x85BdC3308a2Abc46f30d02810d3f4d8f61d0Bed9 "0"  --network goerli

deployed contract address https://goerli.etherscan.io/address/0x85BdC3308a2Abc46f30d02810d3f4d8f61d0Bed9#code