pragma solidity 0.8.27;

import {Test, console, stdError} from "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract EventTest is Test {
    Event public evnt;

    event Transfer(address indexed from, address indexed to, uint amount);

    function setUp() public {
        evnt = new Event();
    }

    function testEmitTransferEvent() public {
        // Check all the indexes.
        vm.expectEmit(true, true, false, true);
        emit Transfer(address(this), address(123), 456);
        evnt.transfer(address(this), address(123), 456);

        // Check only the index 1.
        vm.expectEmit(true, false, false, false);
        emit Transfer(address(this), address(123), 456);
        evnt.transfer(address(this), address(777), 999);
    }

    function testEmitManyTransferEvent() public {}
}
