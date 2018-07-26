pragma solidity ^0.4.23;


/// @title E.T.H. (Extreme Time Heroes) Access Contract for beta and main sale
/// @author Nathan Ginnever

import {HumanStandardToken} from "./lib/token/HumanStandardToken.sol";
import {Ownable} from "./lib/ownership/Ownable.sol";
import {CKProxy} from "./CKProxy.sol";

contract EthAccess is Ownable {

    // how long the sale is open for
    uint256 public betaSaleTime = 0;
    uint256 public numParticipants = 0;

    CKProxy public ck;

    struct Participant {
        address party;
        uint256 balance;
    }

    mapping(address => Participant) public participants;

    constructor(uint256 betaSaleLength, address _ckProxy) public {
      betaSaleTime = betaSaleLength;
      ck = CKProxy(_ckProxy);
    }

    function purchaseQRT() public payable {

    }

    function portalCryptoKitties() public {

    }

    function withdraw() onlyOwner {

    }
}
