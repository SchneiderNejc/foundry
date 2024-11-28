pragma solidity 0.8.27;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import {Wallet} from "../src/Wallet.sol";

// Examples of deal and hoax
// deal(address, uint) - Set balance of address
// hoax(address, uint) - deal + prank, Sets up a prank and set balance

contract WalletTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet{value: 1e18}();
    }

    function _send(uint amount) private {
        (bool ok, ) = address(wallet).call{value: amount}("");
        require(ok, "send ETH failes");
    }

    function testEthBaslance() public {
        console.log("ETH balance", address(this).balance / 1e18);
    }

    function testSendEth() public {
        uint balance = address(wallet).balance;

        // deal(address, uint) - Set balance of address
        deal(address(1), 100);
        assertEq(address(1).balance, 100);

        deal(address(1), 10);
        assertEq(address(1).balance, 10);

        // hoax(address, uint) - deal + prank, Sets up a prank and set balance
        hoax(address(1), 123);
        _send(123);

        assertEq(address(wallet).balance, balance + 123);
    }
}
