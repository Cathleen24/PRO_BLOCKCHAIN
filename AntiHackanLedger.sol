//https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title AntiHackanaLedger
 * @dev A secure ledger that only allows the owner to update balances.
 */
contract AntiHackanaLedger {
    address public owner; 
    mapping(address => uint256) public userBalances;

    event BalanceUpdated(address indexed user, uint256 oldBalance, uint256 newBalance);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    constructor() {
        owner = msg.sender; 
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can update balances!");
        _; 
    }

    function updateBalance(address _user, uint256 _newBalance) public onlyOwner {
        uint256 oldBalance = userBalances[_user];
        userBalances[_user] = _newBalance; 
        
        emit BalanceUpdated(_user, oldBalance, _newBalance);
    }

    function getBalance(address _user) public view returns (uint256) {
        return userBalances[_user];
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "New owner cannot be the zero address");
        emit OwnershipTransferred(owner, _newOwner);
        owner = _newOwner;
    }
}