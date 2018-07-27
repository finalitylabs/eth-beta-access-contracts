pragma solidity ^0.4.23;


/// @title E.T.H. (Extreme Time Heroes) Access Contract for beta and main sale
/// @author Nathan Ginnever

//aimport {HumanStandardToken} from "./lib/token/HumanStandardToken.sol";
import "./lib/ownership/Ownable.sol";
import "./lib/token/CKInterface.sol";
import "./lib/token/ERC721Token.sol";

contract ETHAccess is Ownable, ERC721Token {

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

  constructor(uint256 betaSaleLength, address _ckAddress, string name, string symbol) public 
    ERC721Token(name, symbol)
  {
    betaSaleTime = betaSaleLength;
    ck = CKInterface(_ckAddress);
  }

  function purchaseQRT() public payable {
    require(msg.value == 100 finney);
    require(now > betaSaleTime);
    uint256 _tokenID = totalSupply().add(1);
    super._mint(msg.sender, _tokenID);

  }

  function purchaseQRTbeta() onlyBeta public payable {
    require(msg.value == 100 finney);
    uint256 _tokenID = totalSupply().add(1);
    super._mint(msg.sender, _tokenID);
  }

  function portalCryptoKitties() onlyBeta public {
    require(ck.balanceOf(msg.sender) >= 10);
  }

  function withdraw() onlyOwner {

  }

  function finalize() onlyOwner {
    // transfer ownership of token from sale contract to msg.sender
  }
}
