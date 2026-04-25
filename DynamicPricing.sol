// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DynamicPricing {

    function calculatePrice(
        uint256 basePrice,
        uint256 demandFactor,
        uint256 timeFactor
    ) public pure returns (uint256) {
        
       
        uint256 demandMultiplier = 100 + demandFactor;

 
        uint256 timeMultiplier = 100 + timeFactor;

        uint256 finalPrice = (basePrice * demandMultiplier * timeMultiplier) / 10000;

        return finalPrice;
    }
}