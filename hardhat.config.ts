import type { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";
import "dotenv/config";

const accounts: string[] = [process.env.PRIVATE_KEY_1 as string];

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  defaultNetwork: "klaytn",
  networks: {
    klaytn: {
      url: "https://public-en-cypress.klaytn.net",
      accounts,
    },
  },
};

export default config;
