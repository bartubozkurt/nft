const {ethers} = require("hardhat");

async function main(){

  const Contractchecker = await ethers.getContractFactory("ContractChecker");
  const contractchecker = await Contractchecker.deploy("ContractChecker","CC");

  await contractchecker.deployed();
  console.log("Succes! Contact was deployed to :", contractchecker.address);

  await contractchecker.mint("https://ipfs.io/ipfs/QmfEMB34YKdAmvjU3xPy6abiP7od1Qnn4JhNbhH98jqowF");
  console.log('NFT successfully minted');
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
