pragma solidity ^0.4.23;

contract CKInterface {
  function tokensOfOwner(address _owner) external view returns (uint256[] tokenIds);
  function balanceOf(address _owner) public view returns (uint256 balance);
  function ownerOf(uint256 _tokenId) external view returns (address owner);
}
