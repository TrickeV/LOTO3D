pragma solidity ^0.4.25;

//������Լ
contract Loto3dbase {

    //lol���˻���Ϣ
    mapping (address => uint256) public Tokenbalances;

    //��׼��Ϣ
    mapping (address => mapping (address => uint256)) public allowed;

    //��ֵ value=1 ��ζ��0.01��Ԫ
    uint256 Tokenvalue = 20;

}