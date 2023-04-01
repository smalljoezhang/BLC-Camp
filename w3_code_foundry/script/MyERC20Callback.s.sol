// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "./BaseScript.s.sol";
import "../src/MyERC20Callback.sol";


contract MyERC20Script1 is BaseScript{
    function run() public broadcaster{
        MyERC20Callback token = new MyERC20Callback();
        console.log("MyERC20 deployed on s%", address(token));
    }
}