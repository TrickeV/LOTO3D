pragma solidity ^0.4.25;

import "D:\\solidity\Tokenbase.sol";

//token��������
//name���� symbol��д totalsupply�ܷ�����                                                               ����ʼ�����룩
//transfer֧��  transferFrom֧��    balanceOf���   approve��׼     allowance��׼��Ϣ                   ��������

contract LolToken is Loto3dbase {

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

    string public name;
    string public symbol;
    uint256 public totalSupply;
    uint256 constant private MAX_UINT256 = 2**256 - 1;

    //��ʼ������
    function LolTokenInitial(
        uint256 _initialAmount,
        string _tokenName,
        string _tokenSymbol
    ) public {
        Tokenbalances[msg.sender] = _initialAmount;
        totalSupply = _initialAmount;                                           //������
        name = _tokenName;                                                      //����
        symbol = _tokenSymbol;                                                  //��д
    }

    //֧����_to��֧����ֵ_value
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(Tokenbalances[msg.sender] >= _value);
        Tokenbalances[msg.sender] -= _value;
        Tokenbalances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    //��_from֧����_to��֧����ֵ_value
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

    //_owner���
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return Tokenbalances[_owner];
    }

    //��׼��Ϣ�����߿�֧����_spender�����_value
    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowed[msg.sender][_spender] = _value;

        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    //_owner�ɵ���_spender��token����
    function allowance(address _owner, address _spender) public view returns (uint256 remaining) {
        return allowed[_owner][_spender];
    }

}