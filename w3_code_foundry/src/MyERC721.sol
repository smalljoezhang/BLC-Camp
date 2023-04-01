// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "openzeppelin-contracts/contracts/utils/Counters.sol";


contract MyERC721 is ERC721URIStorage{

    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

        constructor() ERC721(unicode"StudentCardCamp2", "JoeZ") {}

    //  Qmd8QGp9psMWoTNBWK7KKmnMbN7dkTFPhmb9U8bxBETkq2

    // ipfs://QmVXinbG5jSRHdX1JpjkbSAWeVP6k7dyULKcRZwmTdkDGy
    function mint(address student, string memory tokenURI)
        public
        returns (uint256)
    {
        uint256 newItemId = _tokenIds.current();
        _mint(student, newItemId);
        _setTokenURI(newItemId, tokenURI);

        _tokenIds.increment();
        return newItemId;
    }
}