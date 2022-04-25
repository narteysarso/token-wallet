//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
contract Condos is ERC721URIStorage {
    using Counters for Counters.Counter;

    Counters.Counter public Id;

    mapping(address => uint256) public MDTrack;
    
    constructor() ERC721("Condos Token","CONDO") payable {}

    //create NFT method
    function createNFT(address receiver, string calldata metadata) external returns (uint256) {

        Id.increment(); //increase id
        uint newId = Id.current(); //get current id

        _mint(receiver, newId);
        _setTokenURI(newId, metadata);
        MDTrack[receiver] = newId;
        return newId;

    }

    //transfer NFT 
    function transferNFT(address from, address to, uint256 tokenId, bytes calldata metadata) external {
        safeTransferFrom(from, to, tokenId, metadata);
        delete MDTrack[from];
        MDTrack[to] = tokenId;
    } 


}