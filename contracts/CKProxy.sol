pragma solidity ^0.4.23;

import {Ownable} from "./lib/ownership/Ownable.sol";

contract CKProxy is Ownable {

    // how long the sale is open for
    address public ckAddress;

    constructor(address _ckAddress) public {
      ckAddress = _ckAddress;
    }

    function purchaseQRT() public payable {

    }

    function portalCryptoKitties() public {

    }

    function withdraw() onlyOwner {

    }
}
