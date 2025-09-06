// SPDX-License-Identifier: MIT

pragma solidity ^0.8.27;

import { Script } from "forge-std/Script.sol";
import "../src/flashUSD.sol";

contract deployFlashUSD is Script {
    flashUSD public fUSD;

    function run() public {

        vm.startBroadcast();
        fUSD = new flashUSD();
        vm.stopBroadcast();
    }
}
