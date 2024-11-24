// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.27;

import "forge-std/console.sol";

contract Counter {
    uint256 public number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        console.log("HERE", number);
        number++;
    }

    function decrement() public {
        number--;
    }
}
