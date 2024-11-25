// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import {Script} from "forge-std/Script.sol";
import {SimpleBalance} from "src/SimpleBalance.sol";

contract DeploySimpleBalance is Script {
    SimpleBalance public simpleBalance;

    function run() public {
        vm.startBroadcast();
        simpleBalance = new SimpleBalance();
        vm.stopBroadcast();
    }
}
