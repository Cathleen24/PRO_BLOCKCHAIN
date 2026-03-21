//https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayProgram {
    string public programName;
    uint256 public startingBalance;

    // The constructor must be inside the curly braces
    constructor(string memory _programName, uint256 _startingBalance) {
        programName = _programName;
        startingBalance = _startingBalance;
    }

    // Function to retrieve the program info
    function getProgramDetails() public view returns (string memory, uint256) {
        return (programName, startingBalance);
    }
}