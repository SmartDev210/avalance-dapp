pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract GameToken is ERC20, Ownable {
    
    event PointsTrasfer(address indexed from, address indexed to, uint256 amount);
    event TransferERC20(address indexed from, address indexed to, uint256 amount, uint256 releaseTime);

    mapping(address => uint256) private _lockTime;

    constructor ( ) public ERC20("Battle of Olympus", "BOO") {
        _mint(msg.sender, 5000000000 * 10 ** decimals());
    }
    
    function addPoints(address user, uint256 amount) public onlyOwner returns (uint256) {
        transfer(user, amount);
        emit PointsTrasfer(owner(), user, amount);
        return balanceOf(user);
    }

    function takePoints(uint256 amount) public returns (uint256) {
        transfer(owner(), amount);
        return balanceOf(owner());
    }

    function transferERC20(ERC20 token, address to, uint256 amount, uint256 releaseTime) public onlyOwner {        
        require(block.timestamp >= _lockTime[to], "current time is before release time");
        uint256 erc20balance = token.balanceOf(address(this));
        require(amount <= erc20balance, "balance is low");
        token.transfer(to, amount);
        _lockTime[to] = releaseTime;
        emit TransferERC20(address(this), to, amount, releaseTime);
    }
}