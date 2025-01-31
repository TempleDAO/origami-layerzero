// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

abstract contract OwnableOFT {
    modifier onlyOFTOwner() virtual;
}

// @dev Example to use OpenZeppelin's Ownable:
/**
    import { Ownable } from "@openzeppelin/contracts/access/Ownable.sol";
    contract OZOwnableOFT is OwnableOFT, Ownable {
        modifier onlyOFTOwner() override {
            _checkOwner();
            _;
        }
    }
*/

// @dev Example to use Origami's OnlyElevatedAccess:
/**
    import { OrigamiElevatedAccess } from "contracts/common/access/OrigamiElevatedAccess.sol";

    contract OrigamiOwnableOFT is OwnableOFT, OrigamiElevatedAccess {
        modifier onlyOFTOwner() override {
            if (!isElevatedAccess(msg.sender, msg.sig)) revert CommonEventsAndErrors.InvalidAccess();
            _;
        }
    }
*/
