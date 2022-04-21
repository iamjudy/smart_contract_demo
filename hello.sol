// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract HelloWorld {
    // state variable 會被存放在合約自有的 storage 裡面
    string public myString = "hello world";
    string name;
    string public show;
    address owner;

    constructor() {
        // 合約建立時對 state variables 進行初始化
        // msg.sender 就是送出該交易的 address
        name = "unknown";
        owner = msg.sender;
    }

    function assignName(string memory _name) public returns (string memory) {
        // only owner has the permission to assign.
        if (msg.sender == owner) {
            name = _name;
        } else {
            revert("Permission denied!");
        }
        return name;
    }

    // visibility: public 可被其他合約調用
    // mutability: view 代表會讀 state，不會寫 state
    function getName() public view returns (string memory) {
        return name;
    }
} 