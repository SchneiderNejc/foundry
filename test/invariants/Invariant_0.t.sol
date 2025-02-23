// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import "forge-std/Test.sol";
import "forge-std/console.sol";

// Topics
// - Invariant
// - Difference between fuzz and invariant
// - Failing invariant
// - Passing invariant
// - Stats - runs, calls, reverts

contract InvariantIntro {
    bool public flag;

    function func_1() external {}

    function func_2() external {}

    function func_3() external {}

    function func_4() external {}

    function func_5() external {
        flag = true; // Fail happens here.
    }
}

contract IntroInvariantTest is Test {
    InvariantIntro private target;

    function setUp() public {
        target = new InvariantIntro();
    }

    // @note Expect fail from func_5().
    function invariant_flag_is_always_false() public {
        assertEq(target.flag(), false);
    }
}
