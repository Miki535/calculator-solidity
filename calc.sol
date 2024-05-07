// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserInfo {

    int256 public userInfo1;
    int256 public userInfo2;
    string public resu;
    
    function setUserInformation(int256 _info1) public {
        userInfo1 = _info1;
    }

    function setUserInformation2(int256 _info2) public {
        userInfo2 = _info2;
    }
    
    function setOperation(string calldata _operation) public {
        resu = _operation;
    }
    
    function getResult() public view returns (int256) {
        int256 result;
        if (keccak256(bytes(resu)) == keccak256(bytes("+"))) {
            result = userInfo1 + userInfo2;
        }else if (keccak256(bytes(resu)) == keccak256(bytes("-"))) {
            result = userInfo1 - userInfo2;
        }else if (keccak256(bytes(resu)) == keccak256(bytes("/"))) {
            result = userInfo1 / userInfo2;
        } else if (keccak256(bytes(resu)) == keccak256(bytes("*"))) {
            result = userInfo1 * userInfo2;
        }else {
            revert("Invalid operation");
        }
        return result;
    }
}