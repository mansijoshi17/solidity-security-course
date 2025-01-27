// SCH Course Copyright Policy (C): DO-NOT-SHARE-WITH-ANYONE
// https://smartcontractshacking.com/#copyright-policy
pragma solidity ^0.8.13;

/**
 * @title SimpleSmartWallet
 * @author JohnnyTime (https://smartcontractshacking.com)
 */
contract SimpleSmartWallet {
    address public walletOwner;

    constructor() payable {
        walletOwner = msg.sender;
    }

    function transfer(address payable _to, uint _amount) public {
        require(msg.sender == walletOwner, "Only Owner");

        (bool sent, ) = _to.call{value: _amount}("");
        require(sent, "Failed");
    }
}