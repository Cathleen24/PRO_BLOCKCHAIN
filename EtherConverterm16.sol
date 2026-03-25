// https://github.com/Cathleen24/PRO_BLOCKCHAIN

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherConverter {

    // 1. Function to convert Ether to Wei
    // We multiply by '1 ether' (10^18) to get the smallest unit.
    function etherToWei(uint256 etherAmount) public pure returns (uint256) {
        return etherAmount * 1 ether;
    }

    // 2. Function to convert Wei to Ether
    // We divide by '1 ether' to see the whole Ether value.
    function weiToEther(uint256 weiAmount) public pure returns (uint256) {
        return weiAmount / 1 ether;
    }
}
