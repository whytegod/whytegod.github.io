// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WGDVault {

    address public owner;

    event Deposit(address indexed sender, uint256 amount);
    event Withdraw(address indexed to, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(address payable _to, uint256 _amount) external onlyOwner {
        require(address(this).balance >= _amount, "Insufficient funds");

        _to.transfer(_amount);
        emit Withdraw(_to, _amount);
    }
}