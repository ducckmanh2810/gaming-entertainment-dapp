// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PlayToEarn {
    mapping(address => uint256) public rewards;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // Khi người chơi hoàn thành nhiệm vụ
    function completeMission(address player, uint256 amount) external {
        require(msg.sender == owner, "Only owner can reward players");
        rewards[player] += amount;
    }

    function claimReward() external {
        uint256 amount = rewards[msg.sender];
        require(amount > 0, "No reward to claim");
        rewards[msg.sender] = 0;
        payable(msg.sender).transfer(amount);
    }

    receive() external payable {}
}
