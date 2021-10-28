// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTFractionsManager is ERC721, Ownable {
    
    uint256 listingPrice = 0.025 ether;
    uint max_owners = 5;
    
    constructor() ERC721("NewNFT", "NNFT") {}
    
    struct Item {
        uint itemId;
        uint currentowners;
        address itemOwner;
        address seller;
        uint price;
        bool sold;
        bool exists;
    }
    
    struct Owners {
        uint itemId;
        uint currentowners;
        uint share;
        address itemOwner;
    }
    
    mapping(uint => Item) public idToItem;
    mapping(uint => Owners) public partOwnership;
    Owners[] public partowners;
    
    function getlistingPrice() public view returns(uint) {
        return listingPrice;
    }
    
    function enlistNFT(uint _itemId, address _itemOwner, uint _price) public payable {
        require(idToItem[_itemId].exists != true);
        require(msg.value == listingPrice, "Price must be the same as the listing price ");
        payable(address(this)).transfer(msg.value);
        _transfer(_itemOwner, address(this),_itemId);
        idToItem[_itemId] = Item(_itemId,1,_itemOwner, msg.sender, _price, false, true);
        partowners.push(Owners(_itemId,1, _price,_itemOwner));
        partOwnership[_itemId] = Owners(_itemId,1, _price,_itemOwner);
    }
    
    function addOwner(uint _itemId, address _newOwner) public onlyOwner {
        require(idToItem[_itemId].currentowners < max_owners);
        Owners storage newowner = partowners[_itemId];
        newowner.currentowners++;
        newowner.itemOwner = _newOwner;
        newowner.share = _pricedivision(_itemId);
        partOwnership[_itemId] = Owners(_itemId,newowner.currentowners,newowner.share, _newOwner);
        partowners.push(Owners(_itemId,newowner.currentowners, newowner.share,_newOwner))
    }
    
    function _pricedivision(uint _itemId) public returns(uint) {
        Item storage currentitem = idToItem[_itemId];
        Owners storage ownersitem = partowners[_itemId];
        uint _price = currentitem.price/ownersitem.currentowners;
        for(uint i = 0; i < partowners.length; i++) {
            if(partowners[i].itemId == _itemId) {
                partowners[i].share = _price;
            }
        }
        return _price;
    }
    
    function sendEther(uint _itemId, uint _price) public payable {
        require(idToItem[_itemId].price == _price);
        for(uint i = 0; i < partowners.length; i++) {
            if(partowners[i].itemId == _itemId) {
                payable(partowners[i].itemOwner).transfer(partowners[i].share);
            }
        }
    }
}
