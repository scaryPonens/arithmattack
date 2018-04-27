pragma solidity ^0.4.22;

/// @title Arithmattack player state
contract Player {
    address playerAddress;
    struct PlayerState {
        uint16 coins;
        uint16 lives;
        string[] upgrades;
    }

    PlayerState public playerState;

    constructor() public {
        playerAddress = msg.sender;
        gameOver();
    }

    function score(uint16 points) public returns (uint16) {
        playerState.coins += points;
        return playerState.coins;
    }

    function die() public returns (uint16) {
        playerState.lives -= 1;
        if (playerState.lives <= 0) {
            gameOver();
        }
        return playerState.lives;
    }

    function gameOver() public {
        playerState.coins = 0;
        playerState.lives = 3;
    }

    function getCoins() public view returns (uint16) {
        return playerState.coins;
    }

    function getLives() public view returns (uint16) {
        return playerState.lives;
    }
}