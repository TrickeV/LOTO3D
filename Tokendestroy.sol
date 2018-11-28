pragma solidity ^0.4.25;

import "D:\\solidity\Loltoken.sol";

//销毁token

contract Tokendestroy is LolToken {

    event Destroy(address indexed _owner, uint256 _value);

    //销毁lol币的计数
    uint256 destroycount = 0;

    //销毁_from 价值 _value的币，然后处理币值变动
    function LolDes (address _from, uint256 _value) public returns (bool success) {
        require(Tokenbalances[_from] >= _value);

        //销毁
        Tokenbalances[_from] -= _value;
        destroycount += _value;

        //每销毁100000个token价值加1 * 0.01
        Tokenvalue += uint256(destroycount / 100000);
        destroycount %= 100000;

       emit Destroy(_from, _value);
       return true;
    }

}