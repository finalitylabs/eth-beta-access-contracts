pragma solidity ^0.4.23;


/// @title E.T.H. (Extreme Time Heroes) Access Contract for beta and main sale
/// @author Nathan Ginnever

//aimport {HumanStandardToken} from "./lib/token/HumanStandardToken.sol";
import "./lib/ownership/Ownable.sol";
import "./lib/token/CKInterface.sol";

contract ETHAccess is Ownable {

  // how long the sale is open for
  uint256 public betaSaleTime = 0;
  uint256 public numParticipants = 0;
  uint256 public QRTprice;

  CKInterface public ck;

  struct Participant {
    address party;
    uint256 balance;
  }

  mapping(address => Participant) public participants;

  modifier onlyBeta() {
    require(now < betaSaleTime);
    _;
  }

  constructor(uint256 betaSaleLength, address _ckAddress) public {
    betaSaleTime = betaSaleLength;
    ck = CKInterface(_ckAddress);
  }

  function purchaseQRT() public payable {
    require(participants[msg.sender].party == address(0x0));

  }

  function purchaseQRTbeta() onlyBeta public payable {

  }

  function portalCryptoKitties() onlyBeta public {

  }

  function withdraw() onlyOwner {

  }

  function finalize() onlyOwner {
    // transfer ownership of token from sale contract to msg.sender
  }
}
