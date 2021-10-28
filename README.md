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
<li>New owner added to owner array
<li>
<li>
<li>
<li>

<h3></h3>
<li>
<li>
<li>
<li>
<li>
<li>

<h3></h3>
<li>
<li>
<li>
<li>
<li>
<li>

  
<h2>NFT Marketplace</h2>
<li>
<li>
<li>
<li>
<li>
<li>
