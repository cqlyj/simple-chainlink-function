// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.8.26;

import {Script, console} from "forge-std/Script.sol";
import {SimpleBalance} from "src/SimpleBalance.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract SendRequest is Script {
    SimpleBalance simpleBalance;
    uint64 subscriptionId = 3995;
    string[] args = new string[](0);

    function sendRequestToGetBalance(address mostRecentlyDeployed) public {
        simpleBalance = SimpleBalance(mostRecentlyDeployed);
        vm.startBroadcast(0xFB6a372F2F51a002b390D18693075157A459641F);
        simpleBalance.sendRequest(subscriptionId, args);
        vm.stopBroadcast();
    }

    function run() public {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "SimpleBalance",
            block.chainid
        );
        console.log("Most recently deployed address: ", mostRecentlyDeployed);
        sendRequestToGetBalance(mostRecentlyDeployed);
    }
}

contract GetBalance is Script {
    SimpleBalance simpleBalance;
    bytes balance;

    function getBalanceOfUser(address mostRecentlyDeployed) public {
        simpleBalance = SimpleBalance(mostRecentlyDeployed);

        vm.startBroadcast();
        balance = simpleBalance.getBalance();
        vm.stopBroadcast();

        console.log("Balance: ");
        console.logBytes(balance);
    }

    function run() public {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "SimpleBalance",
            block.chainid
        );
        console.log("Most recently deployed address: ", mostRecentlyDeployed);
        getBalanceOfUser(mostRecentlyDeployed);
    }
}
