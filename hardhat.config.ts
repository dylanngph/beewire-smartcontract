import { vars, type HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox-viem";

const deloyer = vars.get("DEPLOYER_PRIVATE_KEY");

const config: HardhatUserConfig = {
  solidity: "0.8.24",
  defaultNetwork: "sepolia",
  networks: {
    hardhat: {
      chainId: 1337,
    },
    sepolia: {
      url: "https://ethereum-sepolia-rpc.publicnode.com	",
      chainId: 11155111,
      accounts: [deloyer],
    },
  },
};

export default config;
