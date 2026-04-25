// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LiquidityLocker {
    address public owner;
    

    mapping(address => uint256) public deposits;
    

    mapping(address => uint256) public lockEnd;

    constructor() {
        owner = msg.sender;
    }


    function deposit() external payable {
        require(msg.value > 0, "Must send Ether");
        

        deposits[msg.sender] += msg.value;
        

        lockEnd[msg.sender] = block.timestamp + 60; 
    }


    function withdraw() external {

        require(block.timestamp >= lockEnd[msg.sender], "Funds are still locked");
        
        uint256 amount = deposits[msg.sender];
        require(amount > 0, "No funds to withdraw");

        deposits[msg.sender] = 0;
        lockEnd[msg.sender] = 0;


        (bool success, ) = payable(msg.sender).call{value: amount}("");
        require(success, "Transfer failed");
    }


    function getTimeLeft(address _user) public view returns (uint256) {
        if (block.timestamp >= lockEnd[_user]) {
            return 0;
        } else {
            return lockEnd[_user] - block.timestamp;
        }
    }
}