// https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataOptimization {
    // 1. Storage Variable: This is saved permanently on the blockchain.
    // It costs "Gas" to change this because it's like writing to a hard drive.
    string public storedMessage = "Stored permanently";

    // 2. updateMessage Function:
    // Takes a 'memory' input (temporary) and saves it into 'storage' (permanent).
    function updateMessage(string memory tempMessage) public {
        storedMessage = tempMessage;
    }

    // 3. compareStorageAndMemory Function:
    // This copies the permanent storage data into a temporary memory variable
    // before returning it. Memory is wiped clean after the function finishes.
    function compareStorageAndMemory() public view returns (string memory) {
        string memory tempMessage = storedMessage; // Copying Storage -> Memory
        return tempMessage;
    }
}