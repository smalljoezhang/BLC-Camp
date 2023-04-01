// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "./BaseScript.s.sol";
import "../src/Vault.sol";

contract VaultScript is BaseScript {
    function run() public broadcaster {
        Vault vault = new Vault(0x7219691cd7ce2b74c130032701cA8356b3b5683A);

        console.log("Vault deployed on %s", address(vault));
        
    }
}