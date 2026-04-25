// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IERC20 {
    function transfer(address to, uint256 amount) external returns (bool);
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract SimpleStaker {
    IERC20 public stakingToken;
    uint256 public lockDuration = 60; // 1 minute

    struct Stake {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => Stake) public stakes;

    constructor(address _token) {
        stakingToken = IERC20(_token);
    }


    function stake(uint256 amount) public {
        require(amount > 0, "Cannot stake 0 tokens");
        
 
        bool success = stakingToken.transferFrom(msg.sender, address(this), amount);
        require(success, "Transfer failed");


        stakes[msg.sender] = Stake({
            amount: amount,
            unlockTime: block.timestamp + lockDuration
        });
    }


    function unstake() public {
        Stake memory userStake = stakes[msg.sender];


        require(userStake.amount > 0, "No active stake found");
        require(block.timestamp >= userStake.unlockTime, "Stake is still locked");


        uint256 totalToWithdraw = (userStake.amount * 110) / 100;


        uint256 contractBalance = stakingToken.balanceOf(address(this));
        require(contractBalance >= totalToWithdraw, "Contract has insufficient rewards");


        delete stakes[msg.sender];


        bool success = stakingToken.transfer(msg.sender, totalToWithdraw);
        require(success, "Withdrawal transfer failed");
    }
}