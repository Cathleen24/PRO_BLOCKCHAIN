// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MultiSigWallet {
    address[] public signers;
    uint256 public approvalThreshold;
    mapping(address => bool) public isSigner;

    struct Transaction {
        address to;
        uint256 value;
        uint256 approvals;
        bool executed;
    }

    Transaction[] public transactions;
    mapping(uint256 => mapping(address => bool)) public approved;

    
    modifier onlySigner() {
        require(isSigner[msg.sender], "Not a signer");
        _;
    }

    constructor(address[] memory _signers, uint256 _threshold) {
        require(_signers.length > 0, "Signers required");
        require(_threshold > 0 && _threshold <= _signers.length, "Invalid threshold");

        for (uint256 i = 0; i < _signers.length; i++) {
            address signer = _signers[i];
            require(signer != address(0), "Invalid signer");
            require(!isSigner[signer], "Signer not unique"); // Prevent duplicates

            isSigner[signer] = true;
            signers.push(signer);
        }
        approvalThreshold = _threshold;
    }


    function proposeTransaction(address _to, uint256 _value) public onlySigner {
        transactions.push(Transaction({
            to: _to,
            value: _value,
            approvals: 0,
            executed: false
        }));
    }


    function approveTransaction(uint256 txId) public onlySigner {
        require(txId < transactions.length, "Transaction does not exist");
        require(!transactions[txId].executed, "Already executed");
        require(!approved[txId][msg.sender], "Already approved by you");

        approved[txId][msg.sender] = true;
        transactions[txId].approvals++;
    }


    function executeTransaction(uint256 txId) public onlySigner {
        require(txId < transactions.length, "Transaction does not exist");
        
        Transaction storage txn = transactions[txId];
        require(!txn.executed, "Already executed");
        require(txn.approvals >= approvalThreshold, "Not enough approvals");

        txn.executed = true; 
        
        (bool success, ) = txn.to.call{value: txn.value}("");
        require(success, "Transaction failed");
    }

    receive() external payable {}
}