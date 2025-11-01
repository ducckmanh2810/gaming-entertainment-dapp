// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CreatorPayment {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function supportCreator(address payable creator) external payable {
        require(msg.value > 0, "Send some CELO");
        creator.transfer(msg.value);
    }
}
