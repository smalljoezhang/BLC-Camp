// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;



contract Bank{

   address public owner;
   mapping(address=> uint) public deposits;

    constructor() {
         owner =  msg.sender;
    }

    
    
    
    receive() external payable{
            deposits[msg.sender]+= msg.value;
        
    }


  modifier onlyOwner() {
        require(msg.sender == owner,"not owner");
        _;    //使用该函数修改器的代码在此运行
    }

    function myDeposit() public view returns(uint) {
        return deposits[msg.sender];


    }

    function withdraw() public{
        (bool success,) = msg.sender.call{value: deposits[msg.sender]}(new bytes(0));
        require(success,"ETH transfer failed");
        deposits[msg.sender] = 0;
    }

    function withdrawAll() public onlyOwner{
        uint b= address(this).balance;
        payable(owner).transfer(b);

    }


}