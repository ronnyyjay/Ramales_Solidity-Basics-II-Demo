//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract FunctionModifiersExample {
    //Define a mapping to store values associated with addresses
    mapping(address => uint256) public valueMapping;

    // Modifier to check if the value being set is not zero
    modifier nonZeroValue(uint256 _value) {
        require(_value != 0, "Value cannot be zero");
        _;
    }

    // Modifier to check if there's a value set for the sender
    modifier  valueHasBeenSet() {
        require(valueMapping[msg.sender] != 0, "No value set for sender");
        _;
    }

     // Function to set a value for the sender's address
    function setValue(uint256 _value) public {
        // Ensure the value being set is not zero
        require(_value != 0, "Value cannot be zero");
        valueMapping[msg.sender] = _value;
    }


    // Function to retirve the value associated with the sender's address
    function getValue() public view returns (uint256) {
        //Ensure the sender has set a value before retrieving
        require(valueMapping[msg.sender] != 0, "No value set for sender");
        return valueMapping[msg.sender];
    }
}
