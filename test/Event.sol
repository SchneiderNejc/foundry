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
        // 1. Declare which data to check.
        // 2. Emit the xpected event.
        // 3. Call the function that should emit the event.
        // Check all the indexes.
        vm.expectEmit(true, true, false, true);
        emit Transfer(address(this), address(123), 456);
        evnt.transfer(address(this), address(123), 456);

        // Check only the index 1.
        vm.expectEmit(true, false, false, false);
        emit Transfer(address(this), address(123), 456);
        evnt.transfer(address(this), address(777), 999);
    }

    function testEmitManyTransferEvent() public {
        address[] memory to = new address[](2);
        to[1] = address(4565);

        uint[] memory amounts = new uint[](2);
        amounts[0] = 777;
        amounts[1] = 888;

        for (uint i; i < to.length; i++) {
            vm.expectEmit(true, true, false, true);
            emit Transfer(address(this), to[i], amounts[i]);
        }

        evnt.transferMany(address(this), to, amounts);
    }
}
