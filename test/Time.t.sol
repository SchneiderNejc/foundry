pragma solidity 0.8.27;

import "forge-std/Test.sol";
import {Auction} from "../src/Time.sol";

contract TimeTest is Test {
    Auction public auction;
    uint private startAt;

    // vm.warp - set block.timestamp to future timestamp
    // vm.roll - set block.number// skip - increament current timestamp
    // skip - increment current timestamp
    // rewind - decrement current timestamp

    function setUp() public {
        auction = new Auction();
        startAt = block.timestamp;
    }

    function testBidFailsBeforeStartTime() public {
        vm.expectRevert("cannot bid");
        auction.bid();
    }

    function testBid() public {
        vm.warp(startAt + 1 days);
        auction.bid();
    }

    function testBidFailsAfterEndTime() public {
        vm.warp(startAt + 2 days);
        vm.expectRevert("cannot bid");
        auction.bid();
    }

    function testTimestamp() public {
        uint time = block.timestamp;
        // skip - increment current timestamp
        skip(100);
        assertEq(block.timestamp, time + 100);

        // rewind - decrement current timestamp
        rewind(10);
        assertEq(block.timestamp, time + 100 - 10);
    }

    function testBlockNumber() public {
        // vm.roll - set blocknumber
        uint blockNumber = block.number;
        vm.roll(999);
        assertEq(block.number, 999);
    }
}
