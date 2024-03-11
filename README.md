# MyToken

This Solidity program is a simple  program that works as creating a token and applying following functions Functionality:
* A new token is created on the local HardHat network.
* Only contract owner should be able to mint tokens.
* Any user can transfer tokens.
* Any user can burn tokens.
## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has functions that allows owner to mint,transfer or burn tokens. This program serves as a simple and straightforward introduction to Solidity programming, and can be used as a stepping stone for more complex projects in the future.

## Getting Started

### Executing program
Deploy on local HardHat Neywork
To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Token.sol). Copy and paste the following code into the file:

```javascript
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

```
Deploy this on Remix

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.0" (or another compatible version), and then click on the "Compile" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the function.
## Help

ERC Contracts must be installed.

## License

This project is licensed under the MIT License.
