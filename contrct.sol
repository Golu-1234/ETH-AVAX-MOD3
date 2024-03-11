// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken {
    string public name;
    string public symbol;
    uint public totalSupply;
    address public owner;
    mapping(address => uint) public balances;

    constructor(string memory _name, string memory _symbol, uint _initialSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply;
        owner = msg.sender;
        balances[msg.sender] = _initialSupply;
    }

    modifier onlyOwn() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    function transfer(address to, uint value) public {
        require(balances[msg.sender] >= value, "Not Enough");
        balances[msg.sender] -= value;
        balances[to] += value;
    }

    function burn(uint value) public {
        require(balances[msg.sender] >= value, "Not Enough");
        balances[msg.sender] -= value;
        totalSupply -= value;
    }

    function mint(address to, uint value) public onlyOwn {
        balances[to] += value;
        totalSupply += value;
    }
}