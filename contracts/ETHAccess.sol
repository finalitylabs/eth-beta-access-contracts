pragma solidity ^0.4.23;


/// @title E.T.H. (Extreme Time Heroes) Access Contract for beta and main sale
/// @author Nathan Ginnever

//aimport {HumanStandardToken} from "./lib/token/HumanStandardToken.sol";
import "./lib/ownership/Ownable.sol";
import "./lib/token/CKInterface.sol";
import "./lib/token/ERC721Token.sol";

contract ETHAccess is Ownable, ERC721Token {

  // how long the sale is open for
  uint256 public betaSaleEnd = 0;
  uint256 public betaQRTLimit = 10; // 10 for testing, 5000 mainnet
  uint256 public portalKittyLimit = 5; // 5 for testing, 500 mainnet
  uint256 public totalPortalKitties = 0;
  uint256 public QRTprice = 100 finney;

  CKInterface public ck;

  struct Participant {
    address party;
    uint256 numPortalKitties;
  }

  // we can use this mapping to allow kitty depositers to claim an E.T.H. fighter NFT in the future
  mapping(address => Participant) public participants;

  modifier onlyBeta() {
    require(now < betaSaleEnd);
    _;
  }

  event QRTPurchase(
    address indexed _from,
    uint256 indexed _time,
    uint256 indexed _tokenId
  );

  event KittiesPortal(
    address indexed _from,
    uint256 indexed _time
  );

  constructor(
    uint256 betaSaleLength, 
    address _ckAddress, 
    string name, 
    string symbol) 
    public 
    ERC721Token(name, symbol)
  {
    betaSaleEnd = betaSaleLength;
    ck = CKInterface(_ckAddress);
    super._mint(msg.sender, 0);
  }

  function purchaseQRT() public payable {
    require(msg.value == QRTprice);
    require(now > betaSaleEnd);

    uint256 _tokenID = totalSupply().add(1);

    participants[msg.sender].party = msg.sender;

    super._mint(msg.sender, _tokenID);
    emit QRTPurchase(msg.sender, now, _tokenID);
  }

  function purchaseQRTbeta() onlyBeta public payable {
    require(msg.value == QRTprice);
    require(totalSupply() < betaQRTLimit);

    uint256 _tokenID = totalSupply().add(1);
    participants[msg.sender].party = msg.sender;

    super._mint(msg.sender, _tokenID);
    emit QRTPurchase(msg.sender, now, _tokenID);
  }

  function portalKitty(uint256 id) onlyBeta public {
    require(ck.ownerOf(id) == msg.sender);
    require(totalPortalKitties <= portalKittyLimit);

    // this assumes client calls an approval for each cryptokitty id
    ck.transferFrom(msg.sender, address(this), id);

    participants[msg.sender].numPortalKitties = participants[msg.sender].numPortalKitties.add(1);
    totalPortalKitties = totalPortalKitties.add(1);
    emit KittiesPortal(msg.sender, now);
  }

  function withdraw() onlyOwner public {
    owner.transfer(address(this).balance);
  }
}
