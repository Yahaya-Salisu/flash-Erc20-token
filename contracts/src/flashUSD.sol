// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.4.0
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

/// @custom:security-contact yahayasalisu162@gmail.com
contract FlashUSD is ERC20, ERC20Burnable, Ownable {
    mapping(address => uint256) public mintedTime;
    constructor(address initialOwner)
        ERC20("flashUSD", "fUSD")
        Ownable(initialOwner)
    {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
        mintedTime[to] = block.timestamp;
    }

    function _beforetokenTransfer(address from, address to, uint256 amount) internal override {
        require(to == address(0));
        if (block.timestamp > mintedTime + 7 days) {
            uint256 balance = balanceOf(from);
            if (balance > 0) {
                _burn(from, balance);
            }
        }
    }
}
