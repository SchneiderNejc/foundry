pragma solidity 0.8.27;

contract Auction {
    uint public startAt = block.timestamp + 1 days;
    uint public endAt = block.timestamp + 2 days;

    function bid() external {
        require(
            block.timestamp >= startAt && block.timestamp < endAt,
            "cannot bid"
        );
    }

    function end() external {
        require(block.timestamp >= endAt, "cannot end");
    }
}
