//SPDX-License-Identifier:MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft deployMoodNft;

    function setUp() external {
        deployMoodNft = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSI1MDAiIGhlaWdodD0iNTAwIj4gPHRleHQgeD0iMCIgeT0iMTUiIGZpbGw9ImJsYWNrIj5IaSEgWW91ciBicm93c2VyIGRlY29kZWQgdGhpcyA8L3RleHQ+IDwvc3ZnPg==";
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="500" height="500"> <text x="0" y="15" fill="black">Hi! Your browser decoded this </text> </svg>';

        string memory actualUri = deployMoodNft.svgToImageURI(svg);

        assert(
            keccak256(abi.encodePacked(expectedUri)) ==
                keccak256(abi.encodePacked(actualUri))
        );
    }
}
