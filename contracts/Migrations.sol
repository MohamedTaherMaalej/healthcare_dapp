// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract Migrations {
    address internal owner = msg.sender;
    uint internal lastCompletedMigration;

    event MigrationCompleted(uint completed);

    modifier restricted() {
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;
    }

    constructor() {
        // Set an initial value for lastCompletedMigration when the contract is deployed
        lastCompletedMigration = 0;
    }

    function setCompleted(uint completed) public restricted {
        lastCompletedMigration = completed;

        // Emit an event to log the completion of a migration
        emit MigrationCompleted(completed);
    }
}
