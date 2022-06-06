// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract TestContract {
    uint256 public x = 5;
    uint256 public values = 123;

    function set(uint256 _x) public {
        x = _x;
    }

    function get() public view returns (uint256) {
        return x;
    }

    function setXandReceiveEther(uint256 _x) external payable {
        x = _x;
        values = msg.value;
    }
}

contract CallTestContract {
    // function set(TestContract _call, uint256 x) external {
    //     _call.set(x);
    // }
    function set(address call, uint256 x) external {
        TestContract(call).set(x);
    }

    function setXandReceiveEther(address call, uint256 x) external payable {
        TestContract(call).setXandReceiveEther{value: msg.value}(x);
    }
}
