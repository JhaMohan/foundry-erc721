//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory sadSvg = vm.readFile("./images/sad.svg");
        string memory happySvg = vm.readFile("./images/happy.svg");
        string memory SAD_SVG_URI = svgToImageURI(sadSvg);
        string memory HAPPY_SVG_URI = svgToImageURI(happySvg);
        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(SAD_SVG_URI, HAPPY_SVG_URI);
        vm.stopBroadcast();
        return moodNft;
    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        // example
        // <svg xmlns="http://www.w3.org/2000/svg" ...... </svg>
        // data:image/svg+xml;base64,PHN2ZyB2aWV3Qm94PSIwIDAgMjAwIDIwMCIgd2lkd....
        string memory baseURI = "data:image/svg+xml;base64,";
        string memory svgBase64Encoded = Base64.encode(
            bytes((abi.encodePacked(svg)))
        );

        return string(abi.encodePacked(baseURI, svgBase64Encoded));
    }
}
