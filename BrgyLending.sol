// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayLending {
    struct LoanRequest {
        address payable borrower; 
        uint256 amount;
        string reason;
        bool isFunded;
        address lender;
    }

    uint256 public loanCounter;
    mapping(uint256 => LoanRequest) public loans;

    event LoanRequested(uint256 loanId, address borrower, uint256 amount, string reason);
    event LoanFunded(uint256 loanId, address lender);


    function requestLoan(uint256 amount, string memory reason) public {
        require(amount > 0, "Amount must be greater than zero");
        
        loanCounter++;
        loans[loanCounter] = LoanRequest({
            borrower: payable(msg.sender),
            amount: amount,
            reason: reason,
            isFunded: false,
            lender: address(0)
        });

        emit LoanRequested(loanCounter, msg.sender, amount, reason);
    }


    function fundLoan(uint256 loanId) public payable {

        LoanRequest storage loan = loans[loanId];


        require(loan.amount > 0, "Loan does not exist");
        require(!loan.isFunded, "Loan already funded");
        require(msg.value == loan.amount, "Must send exact loan amount");

        loan.isFunded = true;
        loan.lender = msg.sender;


        loan.borrower.transfer(msg.value);

        emit LoanFunded(loanId, msg.sender);
    }
}