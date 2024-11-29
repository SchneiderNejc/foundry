// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/interfaces/IERC20.sol";

contract WhaleTest is Test {
    IERC20 public dai;

    function setUp() public {
        // Main-net DAI address.
        dai = IERC20(0x6B175474E89094C44Da98b954EedeAC495271d0F);
    }

    function testDeposit() public {
        address alice = address(123);

        uint256 balanceBefore = dai.balanceOf(alice);
        console.log("balance before", balanceBefore);

        uint256 totalBefore = dai.totalSupply();
        console.log("total supply before", totalBefore / 1e18);

        // token, account, amount, adjust total supply
        deal(address(dai), alice, 1e6 * 1e18, true);

        uint256 balanceAfter = dai.balanceOf(alice);
        console.log("balance after", balanceAfter / 1e18);

        uint256 totalAfter = dai.totalSupply();
        console.log("total supply after", totalAfter / 1e18);
    }
}
