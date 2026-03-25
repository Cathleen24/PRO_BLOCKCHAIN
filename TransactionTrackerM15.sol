//https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransactionTracker {
    address public caller;
    uint256 public transactionTime;

    // This creates a "log" that pops up in the Remix console
    event LogUpdated(address indexed newCaller, uint256 newTime);

    function updateTransaction() public {
        caller = msg.sender;
        transactionTime = block.timestamp;

        // This ensures you SEE the update in the transaction logs
        emit LogUpdated(msg.sender, block.timestamp);
    }
}