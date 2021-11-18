// SPDX-License-Identifier: UNLICENCED

pragma solidity ^0.8.0;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// we inherit the contract we imported to have access to contract's methods
contract MyEpicNFT is ERC721URIStorage {
  // from OpenZeppelin to help us keep track of tokenIds.
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds; // initialize tokenId as a counter

  // we need to pass the name of our NFTs token and it's symbol.
  constructor() ERC721 ("SpaceNFT", "SPACE") {
    console.log("This is my NFT contract");
  }

  // a function our user will hit to get their NFT.
  function makeAnEpicNFT() public {
    // get the current tokenId, this starts at 0
    uint256 newItemId = _tokenIds.current();

    // Actually mint the NFT to the sender using msg.sender.
    _safeMint(msg.sender, newItemId);

    // Set the NFTs data.
    _setTokenURI(newItemId, "https://jsonkeeper.com/b/HK41");

    console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

    // increment the counter for when the next NFT is minted.
    _tokenIds.increment();
  }
}