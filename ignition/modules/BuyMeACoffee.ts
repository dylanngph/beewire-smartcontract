import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
import { vars } from "hardhat/config";

const initialOwner = vars.get("INITIAL_OWNER");

const buyMeACoffeeModule = buildModule("BuyMeACoffeeModule", (m) => {
  const buyMeACoffee = m.contract("BuyMeACoffee", [initialOwner]);

  console.log(`Deploying BuyMeACoffee with initial owner: ${initialOwner}`);

  return { buyMeACoffee };
});

export default buyMeACoffeeModule;
