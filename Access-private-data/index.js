const ethers = require("ethers");

const provider = new ethers.providers.JsonRpcProvider(
  "https://rinkeby.infura.io/v3/65fe2fc1d0cd42e9a4d4bb83f607d9be"
);

const address = "0xdc5c5c561a384c211b106fd9f8201b3ccb78b2fd";
//Returns the Bytes32 value of the position pos at address addr, as of the blockTag.

async function getStorages() {
  const slot0 = await provider.getStorageAt(address, 0);
  console.log(parseInt(slot0));
  const slot1 = await provider.getStorageAt(address, 1);
  console.log(slot1);
  const slot2 = await provider.getStorageAt(address, 2);
  console.log(ethers.utils.parseBytes32String(slot2));
  const slot6 = await provider.getStorageAt(address, 6);
  console.log(slot6);
}
getStorages();
