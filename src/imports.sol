pragma solidity 0.8.27;

import "solmate/tokens/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Token is Ownable(msg.sender), ERC20("name", "symbol", 18) {}
