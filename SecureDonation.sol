// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. Imports must be at the top of the file
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";

// 2. Use 'is' to inherit the security features
contract SecureDonation is Ownable, ReentrancyGuard {
    uint256 public totalDonations;
    mapping(address => uint256) public donations;

    // 3. Pass msg.sender to the Ownable constructor to set the manager
    constructor() Ownable(msg.sender) {}

    function donate() external payable nonReentrant {
        require(msg.value > 0, "Donation must be greater than zero.");
        donations[msg.sender] += msg.value;
        totalDonations += msg.value;
    }

    function withdraw() external onlyOwner nonReentrant {
        require(address(this).balance > 0, "No funds to withdraw.");
        
        uint256 amount = address(this).balance;
        
        // 4. Using 'call' is the recommended way to send Ether
        (bool success, ) = owner().call{value: amount}("");
        require(success, "Withdrawal failed.");
    }
}