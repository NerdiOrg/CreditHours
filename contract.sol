// SPDX-License-Identifier: BSD-3-Clause
pragma solidity ^0.8.4;

contract CreditHours {

    address private owner;
    mapping (address => uint) private balances;

    // Event for transferring credit hours
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() {
        owner = msg.sender; // Set the contract owner to the address deploying the contract
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    modifier onlyOwnerOrSender(address from) {
        require(msg.sender == owner || msg.sender == from, "Caller is not the owner or the sender");
        _;
    }

    function addHours(address to, uint creditHours) public onlyOwner {
        balances[to] += creditHours;
    }

    function deductHours(address from, uint creditHours) public onlyOwner {
        require(balances[from] >= creditHours, "Not enough credit hours");
        balances[from] -= creditHours;
    }

    function transferHours(address from, address to, uint creditHours) public onlyOwnerOrSender(from) {
        require(balances[from] >= creditHours, "Not enough credit hours to transfer");
        balances[from] -= creditHours;
        balances[to] += creditHours;
        emit Transfer(from, to, creditHours);
    }

    function getBalance(address addr) public view returns (uint) {
        return balances[addr];
    }

}
