pragma solidity ^0.4.25;

import "D:\\solidity\Tokenbase.sol";

//token基础操作
//name名称 symbol缩写 totalsupply总发行量                                                               （初始化输入）
//transfer支付  transferFrom支付    balanceOf余额   approve批准     allowance批准信息                   （操作）

contract LolToken is Loto3dbase {

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    string public name;
    string public symbol;
    uint256 public totalSupply;
    uint256 constant private MAX_UINT256 = 2**256 - 1;

    //初始化函数
    function LolTokenInitial(
        uint256 _initialAmount,
        string _tokenName,
        string _tokenSymbol
    ) public {
        Tokenbalances[msg.sender] = _initialAmount;
        totalSupply = _initialAmount;                                           //发行量
        name = _tokenName;                                                      //名称
        symbol = _tokenSymbol;                                                  //缩写
    }

    //支付到_to，支付价值_value
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(Tokenbalances[msg.sender] >= _value);
        Tokenbalances[msg.sender] -= _value;
        Tokenbalances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    //从_from支付到_to，支付价值_value
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint256 allowance = allowed[_from][msg.sender];
        require(Tokenbalances[_from] >= _value && allowance >= _value);
        Tokenbalances[_to] += _value;
        Tokenbalances[_from] -= _value;
        if (allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _value;
        }

        emit Transfer(_from, _to, _value);
        return true;
    }

    //_owner余额
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return Tokenbalances[_owner];
    }

    //批准消息发送者可支付给_spender的余额_value
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    //_owner可调用_spender的token个数
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

}