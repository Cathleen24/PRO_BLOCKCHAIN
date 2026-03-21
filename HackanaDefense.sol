//https://github.com/Cathleen24/PRO_BLOCKCHAIN
pragma solidity ^0.8.0;
contract HackanaDefense {
    uint256 public criticalData;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

      function updateCriticalData(uint256 _newData) public {
     require(msg.sender == owner, "Access denied: Only owner allowed.");
    criticalData = _newData;
  }

   error Unauthorized(address caller);

function restrictedUpdate(uint256 _newData) public {
    if (msg.sender != owner) {
        revert Unauthorized(msg.sender); // Much cheaper than a long string!
    }
    criticalData = _newData;
}
}
