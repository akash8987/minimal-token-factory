const hre = require("hardhat");

async function main() {
  const [deployer] = await hre.ethers.getSigners();
  console.log("Deploying contracts with the account:", deployer.address);

  const Token = await hre.ethers.getContractFactory("CustomToken");
  
  // Params: Name, Symbol, Cap (1M), Initial Supply (100k)
  const token = await Token.deploy("Gemini Ledger", "GML", 1000000, 100000);

  await token.waitForDeployment();

  console.log("Token deployed to:", await token.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
