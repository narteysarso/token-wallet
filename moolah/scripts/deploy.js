
const hre = require("hardhat");

async function main() {

  const Moolah = await hre.ethers.getContractFactory("MoolahCoin");
  const Condos = await hre.ethers.getContractFactory("Condos");
  const moolah = await Moolah.deploy();
  const condos = await Condos.deploy();

  const contractMoolah = await moolah.deployed();
  const contractCondos = await condos.deployed();

  await contractMoolah.mint("0xeb7bb775d89E623A20464A727Ee379f1Dea014b6", hre.ethers.utils.parseEther('1000' ) );
  await contractCondos.createNFT("0xeb7bb775d89E623A20464A727Ee379f1Dea014b6", "Ghana, Kumasi");


  console.log("Moolah deployed to:", moolah.address);
  console.log("Condos deployed to:", condos.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
