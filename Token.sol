// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title CustomToken
 * @dev Implementation of a Capped, Burnable ERC20 Token.
 */
contract CustomToken is ERC20Capped, ERC20Burnable, Ownable {
    constructor(
        string memory name,
        string memory symbol,
        uint256 cap,
        uint256 initialSupply
    ) ERC20(name, symbol) ERC20Capped(cap * 10**decimals()) Ownable(msg.sender) {
        require(initialSupply <= cap, "Initial supply exceeds cap");
        _mint(msg.sender, initialSupply * 10**decimals());
    }

    /**
     * @dev Overrides _update to ensure ERC20Capped logic is integrated.
     */
    function _update(address from, address to, uint256 value)
        internal
        virtual
        override(ERC20, ERC20Capped)
    {
        super._update(from, to, value);
    }
}
