pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 */

contract GameToken is ERC20, Ownable {

    constructor ( ) public ERC20("GameToken", "GTK") {

        _mint(msg.sender, 10000000000000000);
    }

    function addPoints(address user, uint256 amount) public onlyOwner returns (uint256) {
        transfer(user, amount);
        return balanceOf(user);
    }

    function takePoints(uint256 amount) public returns (uint256) {
        transfer(owner(), amount);
        return balanceOf(address(this));
    }
}