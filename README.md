# CreditHours
A Solidity smart contract that allows a person or company to manage credit hours for future client projects. This can be used to track unused hours or at the start of new agreements / scopes of work.


    ## Smart Contract Overview

    The contract is owned by the address that deploys it. The owner has special privileges to add and deduct credit hours for any address. In addition, the contract owner and the original address holder have the rights to transfer credit hours from one address to another.

    ## Features

    - **Add Hours**: The contract owner can add credit hours to any address.
    - **Deduct Hours**: The contract owner can deduct credit hours from any address.
    - **Transfer Hours**: The contract owner or the original address holder can transfer credit hours from one address to another.
    - **Get Balance**: Anyone can check the credit hours balance of any address.

    ## Contract Functions

    ### addHours

    The `addHours` function allows the contract owner to add credit hours to an address.

    ```solidity
    function addHours(address to, uint creditHours) public onlyOwner;
    ```

    ### deductHours

    The `deductHours` function allows the contract owner to deduct credit hours from an address. An error is thrown if the address does not have enough credit hours.

    ```solidity
    function deductHours(address from, uint creditHours) public onlyOwner;
    ```

    ### transferHours

    The `transferHours` function allows the contract owner or the original address holder to transfer credit hours from one address to another. An error is thrown if the from address does not have enough credit hours.

    ```solidity
    function transferHours(address from, address to, uint creditHours) public onlyOwnerOrSender(from);
    ```

    ### getBalance

    The `getBalance` function allows anyone to check the credit hours balance of an address.

    ```solidity
    function getBalance(address addr) public view returns (uint);
    ```

    ## Events

    ### Transfer

    The `Transfer` event is emitted when a successful transfer of credit hours is made.

    ```solidity
    event Transfer(address indexed from, address indexed to, uint256 value);
    ```

    ## Notes

    Please note that this contract is a simple example and might not be secure for a production environment. Solidity contracts must be carefully audited for security vulnerabilities before use in a production environment.
