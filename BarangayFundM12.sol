//https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayFund {
    uint256 public totalFunds;
    
    // NEW: This mapping acts like a digital ledger/notebook
    // It maps an address (the person) to a uint256 (their total contribution)
    mapping(address => uint256) public residentContributions;

    event FundUpdated(uint256 newAmount, address updatedBy);

    function depositFunds(uint256 amount) public {
        require(amount > 0, "Deposit amount must be greater than zero.");
        
        totalFunds += amount;

        // NEW: Record the contribution for this specific person
        residentContributions[msg.sender] += amount;

        emit FundUpdated(totalFunds, msg.sender);
    }
}