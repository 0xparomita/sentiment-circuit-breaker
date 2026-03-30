// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/utils/Pausable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract PausableTreasury is Pausable, AccessControl {
    bytes32 public constant SENTIMENT_ORACLE_ROLE = keccak256("SENTIMENT_ORACLE_ROLE");
    bytes32 public constant DAO_ADMIN_ROLE = keccak256("DAO_ADMIN_ROLE");

    event EmergencyFrozen(address indexed triggerer, string reason);

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    /**
     * @dev Triggered by the Discord Sentiment Oracle when a veto threshold is hit.
     */
    function triggerPanicPause(string calldata _reason) external onlyRole(SENTIMENT_ORACLE_ROLE) {
        _pause();
        emit EmergencyFrozen(msg.sender, _reason);
    }

    /**
     * @dev Only the main DAO Governance (via Timelock) can unpause.
     */
    function resumeOperations() external onlyRole(DAO_ADMIN_ROLE) {
        _unpause();
    }

    function withdraw(address _to, uint256 _amount) external whenNotPaused {
        // Logic for treasury withdrawals...
    }
}
