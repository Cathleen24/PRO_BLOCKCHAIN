// https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayServiceFees {
    // 1. Defined State Variable
    uint256 public certificationFee = 100;

    // 2. Implemented View Function
    function getCertificationFee() public view returns (uint256) {
        return certificationFee;
    }

    // 3. Implemented Pure Function
    function calculateTotalCost(uint256 numberOfCertifications) public pure returns (uint256) {
        return numberOfCertifications * 100;
    }
}