//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MoolahCoin is ERC20Capped, Ownable {

    constructor() ERC20("Moolah Coin","MC") ERC20Capped(10000000 ** 10 * 18) payable {    }

    function mint(address _account, uint256 _amount) external onlyOwner {
        _mint(_account, _amount);
    }
}