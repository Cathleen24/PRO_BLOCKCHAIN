// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BaseContract {
    string public organizationName;


    function setOrganizationName(string memory name) public {
       
        require(bytes(name).length > 0, "Name cannot be empty");
        organizationName = name;
    }
}


contract DerivedContract is BaseContract {
    uint256 public fundBalance;

    // Task 2: Adds unique features while keeping the parent's features
    function depositFunds(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        fundBalance += amount;
    }
}