# Blockship Marketplace

<h2>NFT Fractions Manager</h2>
<li>Inherits from ERC721 and Ownable
<li>Declares a specific price for enlisting contracts
<li>Declares a maximum number of owners
<li>Structs of Item and Owner for calling details about entered data
<li>Two Mappings: idtoItem and partOwnership declared to store data
<li>Owners array declared to store all the owners of NFTs

<h3>getlistingPrice function</h3>
<li>Allows listing price to be viewed

<h3>enlistNFT function</h3>
<li>takes three parameters itemId, address of itemOwner and price of nft
<li>require function is used to check if the entered itemId already exists in the contract
<li>require function to check that the msg.value matches the listing price, followed by the transfer of the listing price.
<li>NFT transferred to contract from owner of nft
<li>Data of new NFT stored in mapping idToItem and partOwnership
<li>Data also added to array partOwners
  
<h3>addOwner Function</h3>
<li>require check to see if the owner number don't exceed the max owners
<li>pricedivision function called here to set owner shares
<li>New owner added to owner array and updated in owner mapping

<h3>pricedivision function</h3>
<li>share of owner is calculated by dividing the price of the NFT by the number of its owners
<li>Loop is used to set the share of each owner of that particular NFT

<h3>sendEther function</h3>
<li>require checks that the price of the NFT with the passed price
<li>loop is run to send each owner of the sold NFT their share

  
<h2>Blockship NFT Marketplace</h2>
<li>Inherits from NFTFractionsManager contract
<li>enlistitem function is used to enlist new NFTs
<li>additionalOwners function is used to add new owners

<h3>sellNft function</h3> 
<li>require to check that the NFT exists in the contract
<li>transfer function to transfer the NFT to buyer
<li>sendEther function is called to transfer ether
<li>Sold NFT is deleted from the mapping.
