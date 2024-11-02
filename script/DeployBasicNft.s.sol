//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract DeployBasicNft is Script {
    function run() public returns (BasicNft) {
        vm.startBroadcast();
        BasicNft basicNftContract = new BasicNft();
        vm.stopBroadcast();
        console.log("BasicNft", address(basicNftContract));
        return basicNftContract;
    }
}
