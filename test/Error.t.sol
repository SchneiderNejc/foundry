pragma solidity 0.8.27;

import "forge-std/Test.sol";
import {Error} from "../src/Error.sol";

contract ErrorTest is Test {
    Error public err;

    function setUp() public {
        err = new Error();
    }

    function testFail() public {
        err.throwError();
    }

    // Essentially the same as testFail()
    function testRevert() public {
        vm.expectRevert();
        err.throwError();
    }

    function testRequireMessage() public {
        vm.expectRevert(bytes("not authorized"));
        err.throwError();
    }

    function testCustomError() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        err.throwCustomError();
    }

    function testErrorLabel() public {
        assertEq(uint(1), uint(1), "test 1");
        assertEq(uint(1), uint(1), "test 2");
        assertEq(uint(1), uint(1), "test 3");
        assertEq(uint(1), uint(2), "test 4");
        assertEq(uint(1), uint(1), "test 5");
    }
}
