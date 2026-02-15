// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IWGDToken {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function transfer(address recipient, uint256 amount) external returns (bool);
}

contract WGDStaking {

    IWGDToken public token;
    address public owner;
    uint256 public rewardRate = 5;

    mapping(address => uint256) public stakedBalance;
    mapping(address => uint256) public stakingTimestamp;

    event Staked(address indexed user, uint256 amount);
    event Unstaked(address indexed user, uint256 amount, uint256 reward);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(address _tokenAddress) {
        token = IWGDToken(_tokenAddress);
        owner = msg.sender;
    }

    function stake(uint256 _amount) external {
        require(_amount > 0, "Amount must be greater than zero");

        token.transferFrom(msg.sender, address(this), _amount);

        stakedBalance[msg.sender] += _amount;
        stakingTimestamp[msg.sender] = block.timestamp;

        emit Staked(msg.sender, _amount);
    }

    function unstake() external {
        uint256 balance = stakedBalance[msg.sender];
        require(balance > 0, "No stake");

        uint256 reward = (balance * rewardRate) / 100;
        uint256 total = balance + reward;

        stakedBalance[msg.sender] = 0;

        token.transfer(msg.sender, total);

        emit Unstaked(msg.sender, balance, reward);
    }

    function updateRewardRate(uint256 _newRate) external onlyOwner {
        rewardRate = _newRate;
    }
}