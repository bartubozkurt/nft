// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./erc721.sol";

contract ContractChecker is ERC721{

    string public name; // ERC721Metadata
    string public symbol; // ERC721Metadata
    uint256 public tokenCount; 

    mapping (uint256 => string) private _tokenURIs;

    //mapping (address => uint0)


    constructor(string memory _name, string memory _symbol){
        name = _name;
        symbol = _symbol;
    }
    
    // ! returns a URL that points to the Metadata
    function tokenURI(uint256 tokenId) public view returns (string memory){
        require(_owners[tokenId] != address(0), "TokenId does not exist");
        return _tokenURIs[tokenId];
    }


    // ! Creates a new nfts inside our Collection
    function mint(string memory _tokenURI) public {

        tokenCount += 1; // tokenId
        _balances[msg.sender] += 1;
        _owners[tokenCount] = msg.sender;
        _tokenURIs[tokenCount]= _tokenURI;

        emit Transfer(address(0),msg.sender,tokenCount);
    }

    function supportsInterface(bytes4 interfaceId) public pure override returns(bool){

        return interfaceId == 0x80ac58cd || interfaceId == 0x5b5e139f;
    }


}
