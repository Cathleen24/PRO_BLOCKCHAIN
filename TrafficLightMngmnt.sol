// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TrafficLightManager {
    // Mapping to track traffic light states by intersection name
    mapping(string => string) public lightState;

    // 1. Constructor: Initialize default states
    constructor() {
        lightState["intersection1"] = "red";
        lightState["intersection2"] = "red";
    }

    /**
     * @dev Updates the light state for a specific intersection.
     * Only "red", "yellow", and "green" are allowed.
     */
    function changeLight(string memory intersection, string memory newState) public {
        // 2. Validate that the newState is one of the allowed values
        // We use keccak256(abi.encodePacked(s)) to compare strings in Solidity
        require(
            keccak256(abi.encodePacked(newState)) == keccak256(abi.encodePacked("red")) ||
            keccak256(abi.encodePacked(newState)) == keccak256(abi.encodePacked("yellow")) ||
            keccak256(abi.encodePacked(newState)) == keccak256(abi.encodePacked("green")),
            "Invalid state! State must be 'red', 'yellow', or 'green'."
        );

        // 3. Update the mapping with the valid new state
        lightState[intersection] = newState;
    }
}