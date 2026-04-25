// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract NFTWithRoyalties {
    address payable public creator; 
    uint256 public royaltyPercentage; 
    address payable public currentOwner; 

    constructor(address payable _creator, uint256 _percentage) {
        creator = _creator;
        royaltyPercentage = _percentage;
        currentOwner = _creator;
    }

    function transferNFT(address payable buyer, uint256 salePrice) public payable {

        require(msg.value == salePrice, "Incorrect payment amount");
        require(buyer != address(0), "Invalid buyer address");


        uint256 royalty = (salePrice * royaltyPercentage) / 100;
        uint256 sellerAmount = salePrice - royalty;

        creator.transfer(royalty);
        currentOwner.transfer(sellerAmount);
        currentOwner = buyer;

    }
    
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}