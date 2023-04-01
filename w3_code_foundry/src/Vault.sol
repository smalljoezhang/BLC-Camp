//SPDX-License-Identifier: MIT

import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

pragma solidity ^0.8.0;

contract Vault {

    address public immutable token;

    constructor(address _token)
    {
        token =_token;
    }
    mapping(address => uint) deposited;




    function deposit(address user, uint amount) external{
        require(IERC20(token).transferFrom(msg.sender, address(this), amount), "transfer failed");  // equals approve, transfer 
        deposited[user]+= amount;

    }

    

}