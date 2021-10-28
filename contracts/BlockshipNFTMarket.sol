// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./NFTFractionsManager.sol";

contract NFTMarket is NFTFractionsManager {
    
    function enlist(uint _itemId, address _itemOwner, uint _price) public payable {
        enlistNFT(_itemId,_itemOwner,_price);
    }
    
    function additionalOwners(uint _itemId, address _additionalOwner) public {
        addOwner(_itemId,_additionalOwner);
    }
    
    function sellNft(uint _itemId, address _buyer, uint _price) public {
        require(idToItem[_itemId].exists == true);
        _transfer(address(this), _buyer, _itemId);
        sendEther(_itemId, _price);
        delete idToItem[_itemId];
    }
}