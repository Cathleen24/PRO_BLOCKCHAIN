//https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomerRegistry {

    // Define the structure of a customer
    struct Customer {
        string name;
        address walletAddress;
        uint256 balance;
    }

    // Mapping moved inside the contract scope
    mapping(address => Customer) public customers;

    // Function to register a new customer
    function addCustomer(string memory _name, uint256 _balance) public {
        customers[msg.sender] = Customer({
            name: _name,
            walletAddress: msg.sender,
            balance: _balance
        });
    }

    // Function to retrieve customer details
    function getCustomer(address _walletAddress) 
        public 
        view 
        returns (string memory name, address wallet, uint256 balance) 
    {
        Customer storage customer = customers[_walletAddress];
        return (customer.name, customer.walletAddress, customer.balance);
    }
}