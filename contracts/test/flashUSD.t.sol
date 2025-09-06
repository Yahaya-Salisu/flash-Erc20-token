// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import { Test } from "forge-std/Test.sol";
import "../src/flashUSD.sol";

contract flashUSD is flashUSD, Test {
    flashUSD public fUSD;
    address public owner;
    address public User1;
    address public User2;

    function setUp() public {
        fUSD = new flashUSD();
        owner = address(this);
        User1 = makeAddr("User1");
        User2 = makeAddr("User2");
        newOwner = makeAddr("newOwner");
    }
}
