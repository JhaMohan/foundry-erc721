// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// So why do we care about all this encoding stuff?

// In order to call a function using only the data field of call, we need to encode:
// The function name
// The parameters we want to add
// Down to the binary level

// Now each contract assigns each function it has a function ID. This is known as the "function selector".
// The "function selector" is the first 4 bytes of the function signature.
// The "function signature" is a string that defines the function name & parameters.
// Let's look at this

// Example Function selector:
// 0xa9059cbb

// Example Function signature
// "transfer(address,uint256)"

contract CallMeAnything {

}
