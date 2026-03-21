//https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PalengkeCalculator {

    uint256[] public prices;
    uint256[] public quantities;

    function addOrder(uint256 _pricePerUnit, uint256 _quantity) public {
        prices.push(_pricePerUnit);
        quantities.push(_quantity);
    }

    function calculateTotal(uint256 _pricePerUnit, uint256 _quantity)
        public
        pure
        returns (uint256)
    {
        return _pricePerUnit * _quantity;
    }

    function calculateGrandTotal() public view returns (uint256) {
        uint256 total = 0;

        for (uint256 i = 0; i < prices.length; i++) {
            total += prices[i] * quantities[i];
        }

        return total;
    }

    function calculateChange(uint256 _totalCost, uint256 _payment)
        public
        pure
        returns (uint256)
    {
        require(_payment >= _totalCost, "Insufficient payment.");
        return _payment - _totalCost;
    }

    function applyDiscount(uint256 _totalCost, uint256 _discountPercent)
        public
        pure
        returns (uint256)
    {
        require(_discountPercent <= 100, "Invalid discount percentage.");
        return _totalCost - ((_totalCost * _discountPercent) / 100);
    }

    function splitBill(uint256 _totalCost, uint256 _groupSize)
        public
        pure
        returns (uint256)
    {
        require(_groupSize > 0, "Group size must be greater than zero.");
        return _totalCost / _groupSize;
    }
}