// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SecureFund {
    address public owner;
    uint256 public totalDonations;

    constructor() {
        owner = msg.sender;
    }

    function donate(uint256 amount) public payable {
        require(amount > 0, "Donation must be greater than zero");
        totalDonations += amount;
    }

    function withdraw(uint256 amount) public onlyOwner {
        payable(owner).transfer(address(this).balance);
        require(msg.sender == owner, "Only the owner can withdraw");
        require(amount <= totalDonations, "Not enough funds");
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }
}