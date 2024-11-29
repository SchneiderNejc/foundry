// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import "forge-std/Test.sol";
import "forge-std/console.sol";

interface IWETH {
    function balanceOf(address) external view returns (uint256);

    function deposit() external payable;
}

contract ForkTest is Test {
    IWETH public weth;

    function setUp() public {
        // Main-net WETH address.
        weth = IWETH(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2);
    }

    function testDeposit() public {
        uint256 balanceBefore = weth.balanceOf(address(this));
        console.log("balance before", balanceBefore);

        weth.deposit{value: 100}();

        uint256 balanceAfter = weth.balanceOf(address(this));
        console.log("balance after", balanceAfter);
    }
}
