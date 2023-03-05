// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// contract Objective is ERC721, ERC721Enumerable, ERC721URIStorage, Ownable {
contract Objective is ERC721, ERC721URIStorage, Ownable {
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIdCounter;

  constructor() ERC721("RealFT Objective", "RFT") {}

  function safeMint(address to, uint256 tokenId) public onlyOwner {
    _safeMint(to, tokenId);
  }

  function _baseURI() internal pure override returns (string memory) {
    return "https://ipfs.io/ipfs/";
  }

  function mintItem(address to, string memory uri) public returns (uint256) {
    _tokenIdCounter.increment();
    uint256 tokenId = _tokenIdCounter.current();
    _safeMint(to, tokenId);
    _setTokenURI(tokenId, uri);
    return tokenId;
  }

  // The following functions are overrides required by Solidity.

  //   function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override(ERC721, ERC721Enumerable) {
  //     super._beforeTokenTransfer(from, to, tokenId);
  //   }

  //   function _beforeTokenTransfer(address from, address to, uint256 tokenId) internal override ERC721 {
  //     super._beforeTokenTransfer(from, to, tokenId);
  //   }

  function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
    super._burn(tokenId);
  }

  function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory) {
    return super.tokenURI(tokenId);
  }

  //   function supportsInterface(bytes4 interfaceId) public view override ERC721 returns (bool) {
  //     return super.supportsInterface(interfaceId);
  //   }

  //   function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
  //     return super.supportsInterface(interfaceId);
  //   }
}
