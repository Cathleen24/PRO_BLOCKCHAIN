// https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. Importing the audited OpenZeppelin ERC20 standard
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// 2. Inheriting the ERC20 functionality
contract SanJuanCityToken is ERC20 {
    
    // 3. Initializing the token: Name (SanJuanToken) and Symbol (SJT)
    constructor() ERC20("SanJuanToken", "SJT") {
        
        // Minting 1000 tokens to the person who deploys the contract (Neri)
        // We use decimals() to ensure the total units are correct (1000 * 10^18)
        _mint(msg.sender, 1000 * 10 ** decimals());
    }
}