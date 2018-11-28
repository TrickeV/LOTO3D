pragma solidity ^0.4.25;

//基础合约
contract Loto3dbase {

    //lol币账户信息
    mapping (address => uint256) public Tokenbalances;

    //批准信息
    mapping (address => mapping (address => uint256)) public allowed;

    //币值 value=1 意味着0.01美元
    uint256 Tokenvalue = 20;

}