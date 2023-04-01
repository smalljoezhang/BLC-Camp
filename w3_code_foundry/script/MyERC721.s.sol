// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "./BaseScript.s.sol";
import "../src/MyERC721.sol";

contract MyERC721Script is BaseScript {
    function run() public broadcaster {
        MyERC721 token = new MyERC721();

        console.log("MyERC721 deployed on %s", address(token));

        token.mint(deployer, "ipfs://QmVXinbG5jSRHdX1JpjkbSAWeVP6k7dyULKcRZwmTdkDGy");
    }
}