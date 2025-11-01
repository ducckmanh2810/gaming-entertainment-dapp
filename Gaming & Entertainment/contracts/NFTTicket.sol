// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFTTicket is ERC721URIStorage {
    uint256 public nextId;
    address public owner;

    constructor() ERC721("Event Ticket", "TICKET") {
        owner = msg.sender;
    }

    function mintTicket(address to, string memory metadataURI) external {
        require(msg.sender == owner, "Only owner can mint");
        _mint(to, nextId);
        _setTokenURI(nextId, metadataURI);
        nextId++;
    }
}
