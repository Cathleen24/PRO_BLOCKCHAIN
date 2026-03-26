// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract CustomErrorExample {
    address public owner;
    uint256 public totalBalance;

    // 1. Defining Custom Errors (Saves Gas!)
    error InsufficientFunds(uint256 requested, uint256 available);
    error UnauthorizedAccess(address caller);

    constructor() {
        owner = msg.sender;
        totalBalance = 1000;
    }

    // 2. Withdraw function with security checks
    function withdraw(uint256 amount) public {
        // Check 1: Is the caller the owner?
        if (msg.sender != owner) {
            revert UnauthorizedAccess(msg.sender);
        }

        // Check 2: Is there enough balance?
        if (amount > totalBalance) {
            revert InsufficientFunds(amount, totalBalance);
        }

        // Update the state
        totalBalance -= amount;
    }

    // 3. Simple view function to see the remaining balance
    function checkBalance() public view returns (uint256) {
        return totalBalance;
    }
}