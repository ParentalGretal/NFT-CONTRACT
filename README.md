# NFT-CONTRACT 
This code represents a simple blockchain smart contract written in Cadence. The contract defines a digital collectibles system where users can create and manage non-fungible tokens (NFTs). I'll provide a step-by-step walkthrough of the different parts of the code.

**Contract Definition: CryptoPoops**

1. The contract imports the `NonFungibleToken` library from address `0x03`, which provides the basic functionality for creating and managing NFTs.

2. The contract is defined as inheriting from the `NonFungibleToken` contract, which means it extends the functionality provided by that contract.

3. The contract has several `event` declarations, which are used to emit events that can be listened to outside the contract. These events include `ContractInitialized`, `Withdraw`, and `Deposit`.

4. Inside the contract, there's a `resource` called `NFT`. This represents a single non-fungible token. It has properties like `id`, `name`, `favouriteFood`, and `luckyNumber`.

5. There's another `resource` called `Collection`, which implements the `NonFungibleToken.Provider`, `NonFungibleToken.Receiver`, and `NonFungibleToken.CollectionPublic` interfaces. This represents a collection of NFTs that a user owns.

6. The `Collection` resource contains a dictionary (`ownedNFTs`) to store the NFTs owned by the collection.

7. The `withdraw` function allows the user to withdraw an NFT from their collection by providing the NFT's ID. The withdrawn NFT is removed from the collection and returned.

8. The `deposit` function allows the user to deposit an NFT into their collection.

9. The `getIDs` function returns an array of IDs of NFTs owned by the collection.

10. The `borrowNFT` and `borrowAuthNFT` functions allow borrowing a reference to a specific NFT owned by the collection. The difference between them is that `borrowAuthNFT` returns an authenticated reference to the NFT, which allows modifying the NFT's data.

11. The `createEmptyCollection` function creates an empty collection.

12. The contract also defines a `Minter` resource, which is responsible for creating new NFTs.

13. The `createNFT` function of the `Minter` resource creates a new NFT with the provided data.

14. The `createMinter` function creates a new `Minter` resource.

15. The contract's `init` function initializes the contract. It sets the total supply to 0, emits a `ContractInitialized` event, creates a `Minter` resource, and links a `Collection` capability to the contract storage.

**Transaction:**

1. The transaction script imports the `CryptoPoops` contract.

2. Inside the `prepare` block of the transaction, the script first borrows a reference to the `Minter` resource and a reference to the user's `Collection` if it exists, otherwise, it creates a new collection.

3. Two NFTs (`nft1` and `nft2`) are created using the `createNFT` function of the `Minter` resource and then deposited into the user's collection using the `deposit` function.

**Script:**

1. The script is meant to be used externally to query NFT data.

2. The `main` function takes the contract address and an NFT ID as parameters.

3. It borrows a reference to the contract's `Collection` using the contract address.

4. Then, it calls the `borrowAuthNFT` function of the collection to get an authenticated reference to the specified NFT.

In summary, this code defines a basic NFT contract where users can create NFTs, manage collections of NFTs, deposit and withdraw NFTs, and query NFT data using scripts. It's a simplified example meant to illustrate NFT concepts on the Flow blockchain.
