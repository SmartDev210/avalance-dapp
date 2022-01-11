# avalance-dapp
ERC20 game token with time locked option on Avalance network

Here is the deployed smart contract on Fuji Avalance test network
https://testnet.snowtrace.io/address/0x8a0f9db8a403d073cc6eb89c4b5ada7858fd1616

- Create a .env.json file in your project's root directory:
  {
    "mnemonic": "your-wallet-seed-phrase",
    "snowtraceApiKey": "your-snowtrace-api-key"
  }

- Run the following commands:

  truffle compile
  npx truffle migrate --network fuji
  npx truffle run verify BattleOfOlympusToken --network fuji

