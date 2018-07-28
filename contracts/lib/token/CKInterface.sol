pragma solidity ^0.4.23;

contract CKInterface {
  function totalSupply() public view returns (uint256 total);
  function tokensOfOwner(address _owner) external view returns (uint256[] tokenIds);
  function balanceOf(address _owner) public view returns (uint256 balance);
  function ownerOf(uint256 _tokenId) external view returns (address owner);
  function transferFrom(address _from, address _to, uint256 _tokenId) external;
  function approve(address _to, uint256 _tokenId) external;

  function createPromoKitty(uint256 _genes, address _owner) external;
}
