pragma solidity ^0.4.23;


/// @title E.T.H. (Extreme Time Heroes) Access Contract for beta and main sale
/// @author Nathan Ginnever

import {HumanStandardToken} from "./lib/token/HumanStandardToken.sol";

contract EthAccess {

    string public constant NAME = "Ledger Channel";
    string public constant VERSION = "0.0.1";

    // how long the sale is open for
    uint256 public betaSaleTime = 0 minutes;

    struct Participant {
        address party;
        uint256 balance;
    }

    mapping(address => Participant) public participants;

    function purchaseQRT() public payable {

    }

    function portalCryptoKitties(bytes32 _lcID) public {

    }
}
