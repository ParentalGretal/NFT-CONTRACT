import CryptoPoops from 0x03
transaction {
  prepare(signer: AuthAccount) {
    let minterRef = signer.borrow<&CryptoPoops.Minter>(from: /storage/Minter)
      ?? panic("Could not borrow Minter reference")

    var collectionRef = signer.borrow<&CryptoPoops.Collection>(
      from: /storage/NFTCollection
    )
    if collectionRef == nil {
      signer.save(<- CryptoPoops.createEmptyCollection(), to: /storage/NFTCollection)
      collectionRef = signer.borrow<&CryptoPoops.Collection>(from: /storage/NFTCollection)
    }

    let nft1 <- minterRef.createNFT(name: "NFT1", favouriteFood: "paalada", luckyNumber: 1)
    collectionRef!.deposit(token: <- nft1)

    let nft2 <- minterRef.createNFT(name: "NFT2", favouriteFood: "semia", luckyNumber: 2)
    collectionRef!.deposit(token: <- nft2)
  }
}
