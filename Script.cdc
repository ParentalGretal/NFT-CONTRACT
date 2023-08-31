import NonFungibleToken from 0x03

pub fun main(contractAddress: Address, nftID: UInt64): &NonFungibleToken.NFT? {
    let collectionCapability = getAccount(contractAddress)
        .getCapability(/public/NFTCollection)

    let collection = collectionCapability.borrow<&{NonFungibleToken.CollectionPublic}>()
        ?? panic("Could not borrow reference to CollectionPublic")

    return collection.borrowAuthNFT(id: nftID)
}


