// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Encoding {
    function concatString() public pure returns (string memory) {
        return string(abi.encodePacked("Hi there", "Hi mom!"));
    }

    // 0.8.12 +
    function concatStringThroughString() public pure returns (string memory) {
        return string.concat("Hi there", "Hi mom");
    }

    function encodeNumber() public pure returns (bytes memory) {
        bytes memory byteversion = abi.encode(1);
        return byteversion;
    }

    function encodeString() public pure returns (bytes memory) {
        bytes memory bytesversion = abi.encode("some string");
        return bytesversion;
    }

    // this one will save gas in compare to abi.encode
    function encodeStringPacked() public pure returns (bytes memory) {
        bytes memory bytesversion = abi.encodePacked("some string");
        return bytesversion;
    }

    function typecastString() public pure returns (bytes memory) {
        bytes memory bytesversion = bytes("some string");
        return bytesversion;
    }

    function decodeString() public pure returns (string memory) {
        string memory somestring = abi.decode(encodeString(), (string));
        return somestring;
    }

    // this will throw error
    function decodePackedString() public pure returns (string memory) {
        string memory somestring = abi.decode(encodeStringPacked(), (string));
        return somestring;
    }

    function decodePackedStringByTypecast()
        public
        pure
        returns (string memory)
    {
        string memory somestring = string(encodeStringPacked());
        return somestring;
    }

    function multiEncode() public pure returns (bytes memory) {
        bytes memory multiEncodeString = abi.encode(
            "some string",
            "its bigger"
        );
        return multiEncodeString;
    }

    function decodeMultiString()
        public
        pure
        returns (string memory, string memory)
    {
        (string memory someString, string memory someOtherString) = abi.decode(
            multiEncode(),
            (string, string)
        );
        return (someString, someOtherString);
    }
}
