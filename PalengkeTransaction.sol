//https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PalengkeTransactions {
    // State variable must be INSIDE the contract to be modifiable
    uint256[] public payments;

    // Adds a new payment to the array
    function recordPayment(uint256 _amount) public {
        payments.push(_amount);
    }

    // Returns how many payments have been made (the count)
    function getTotalPayments() public view returns (uint256) {
        return payments.length;
    }

    // Retrieves a specific payment amount by its index
    function getPayment(uint256 _index) public view returns (uint256) {
        require(_index < payments.length, "Invalid index.");
        return payments[_index];
    }
}