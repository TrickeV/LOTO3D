pragma solidity ^0.4.25;

import "D:\\solidity\Loltoken.sol";

//����token

contract Tokendestroy is LolToken {

    event Destroy(address indexed _owner, uint256 _value);

    //����lol�ҵļ���
    uint256 destroycount = 0;

    //����_from ��ֵ _value�ıң�Ȼ�����ֵ�䶯
    function LolDes (address _from, uint256 _value) public returns (bool success) {
        require(Tokenbalances[_from] >= _value);

        //����
        Tokenbalances[_from] -= _value;
        destroycount += _value;

        //ÿ����100000��token��ֵ��1 * 0.01
        Tokenvalue += uint256(destroycount / 100000);
        destroycount %= 100000;

       emit Destroy(_from, _value);
       return true;
    }

}