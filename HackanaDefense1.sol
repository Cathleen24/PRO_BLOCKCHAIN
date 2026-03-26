// https://github.com/Cathleen24/PRO_BLOCKCHAIN

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. MathLibrary: Stays the same, but 'internal' is key here.
library MathLibrary {
    function calculatePercentage(
        uint256 base,
        uint256 percent
    ) internal pure returns (uint256) {
        // Solidity handles the math from left to right. 
        // Multiplying first helps maintain precision.
        return (base * percent) / 100;
    }
}

contract HackanaDefense {
    // We can use the 'using' keyword to make the library easier to call!
    using MathLibrary for uint256;

    string public city = "San Juan City";

    function calculateFee(
        uint256 transactionAmount,
        uint256 feePercent
    ) public pure returns (uint256) {
        // Instead of MathLibrary.calculatePercentage, 
        // we can now call it directly on the variable:
        return transactionAmount.calculatePercentage(feePercent);
    }
}
    
    
