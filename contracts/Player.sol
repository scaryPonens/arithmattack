pragma solidity ^0.4.22;

/// @title Arithmattack player state
contract Player {
    address playerAddress;
    struct PlayerState {
        uint coins;
        uint lives;
        string[] upgrades;
    }

    PlayerState public playerState;

    function Player() public {
        playerState.coins = 0;
        playerState.lives = 3;
    }

    function score(uint points) public returns (uint) {
        playerState.coins += points;
        return playerState.coins;
    }

    function die() public returns (uint) {
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

    function getCoins() public view returns (uint) {
        return playerState.coins;
    }

    function getLives() public view returns (uint) {
        return playerState.lives;
    }
}