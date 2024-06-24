// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract BuyMeACoffee is Ownable {
    struct Coffee {
        uint256 id;
        string message;
        uint256 ammount;
        address sender;
        address receiver;
        uint256 timestamp;
    }

    mapping(uint256 => Coffee) public coffees;
    uint256 public coffeeCounter;

    event NewCoffee(
        uint256 id,
        string message,
        uint256 ammount,
        address indexed sender,
        address indexed receiver,
        uint256 timestamp
    );

    constructor(address initialOwner) Ownable(initialOwner) {}

    function buyACoffee(
        string memory _message,
        address _receiver
    ) public payable {
        require(msg.value > 0, "Invalid amount of ether sent");

        coffeeCounter++;
        coffees[coffeeCounter] = Coffee(
            coffeeCounter,
            _message,
            msg.value,
            msg.sender,
            _receiver,
            block.timestamp
        );

        emit NewCoffee(
            coffeeCounter,
            _message,
            msg.value,
            msg.sender,
            _receiver,
            block.timestamp
        );

        (bool success, ) = _receiver.call{value: msg.value}("");
        require(success, "Transfer failed.");
    }

    function getCoffeeById(uint256 _id) public view returns (Coffee memory) {
        return coffees[_id];
    }

    function getCoffeeBySender(
        address _sender
    ) public view returns (Coffee[] memory) {
        //count the number of coffees from the sender
        uint256 count = 0;
        for (uint256 i = 1; i <= coffeeCounter; i++) {
            if (coffees[i].sender == _sender) {
                count++;
            }
        }

        Coffee[] memory result = new Coffee[](count);
        uint256 counter = 0;
        for (uint256 i = 1; i <= coffeeCounter; i++) {
            if (coffees[i].sender == _sender) {
                result[counter] = coffees[i];
                counter++;
            }
        }
        return result;
    }
}
