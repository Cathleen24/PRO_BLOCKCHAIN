//https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayProgram {
    string public programName;
    uint256 public currentBalance;
    address public captain; // The person who deployed the contract

    // Event to log spending for the community to see
    event FundsSpent(uint256 amount, uint256 remainingBalance);

    constructor(string memory _programName, uint256 _startingBalance) {
        programName = _programName;
        currentBalance = _startingBalance;
        captain = msg.sender; // Sets the deployer as the "Captain"
    }

    // Modifier to ensure only the Captain can run certain functions
    modifier onlyCaptain() {
        require(msg.sender == captain, "Only the Barangay Captain can authorize this.");
        _;
    }

    function getProgramDetails() public view returns (string memory, uint256) {
        return (programName, currentBalance);
    }

    // Now protected by 'onlyCaptain'
    function spendFunds(uint256 _amount) public onlyCaptain {
        require(_amount <= currentBalance, "Insufficient funds.");
        currentBalance -= _amount;
        
        emit FundsSpent(_amount, currentBalance); // Records the transaction
    }
}