pragma solidity ^0.5.0;

contract Migrations {
    address public owner; // 외부에서 계약에 접근해야 하므로
    uint public last_completed_migration;

    constructor() public {
        owner = msg.sender;
    }

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    function set_completed(uint completed) public restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricted {
      Migrations upgraded = Migrations(new_address);
      upgraded.set_completed(last_completed_migration);
    }
}