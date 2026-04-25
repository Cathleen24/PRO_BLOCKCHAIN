// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SariSariToken is ERC20 {
    address public owner;

    uint256 public constant MAX_SUPPLY = 50000 * 1e18;


    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized: Only the owner can mint");
        _;
    }

   
    constructor() ERC20("SariSari Token", "SST") {
        owner = msg.sender;

        _mint(owner, 10000 * 1e18); 
    }

    function mint(address to, uint256 amount) public onlyOwner {

        require(totalSupply() + amount <= MAX_SUPPLY, "Exceeds MAX_SUPPLY cap");
        
    
        _mint(to, amount);
    }
}