// https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayWallet {
    // 1. State variable to track total Ether received
    uint256 public totalReceived;

    // 2. Event to log invalid or "mysterious" calls
    event InvalidCall(address sender, uint256 value, bytes data);

    // 3. The Receive Function: Triggered when someone sends plain Ether
    receive() external payable {
        totalReceived += msg.value;
    }

    // 4. The Fallback Function: Triggered for non-existent functions or data
    fallback() external payable {
        emit InvalidCall(msg.sender, msg.value, msg.data);
    }
}