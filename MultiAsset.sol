// https://github.com/Cathleen24/PRO_BLOCKCHAIN
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 1. Imports must always be at the top of the file
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// 2. You must explicitly state that the contract 'is' ERC1155 and Ownable
contract MultiAsset is ERC1155, Ownable {
    
    // Tokens are identified by IDs instead of separate addresses
    uint256 public constant GOLD = 1;      // Like currency (Fungible)
    uint256 public constant ARTIFACT = 2;  // Like a trophy (Non-fungible)

    // 3. Constructor initializes the Metadata URI and sets the owner
    constructor() 
        ERC1155("https://api.bitskwela.com/metadata/{id}.json") 
        Ownable(msg.sender) 
    {
        // Minting initial supply to the deployer (Neri)
        _mint(msg.sender, GOLD, 1000, "");     // 1000 Gold Coins
        _mint(msg.sender, ARTIFACT, 1, "");     // 1 Special Artifact
    }

    // 4. Custom mint function restricted to the owner
    function mint(
        address to, 
        uint256 id, 
        uint256 amount, 
        bytes memory data
    ) public onlyOwner {
        _mint(to, id, amount, data);
    }
}