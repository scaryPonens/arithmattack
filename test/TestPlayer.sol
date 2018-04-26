pragma solidity ^0.4.22;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Player.sol";

contract TestPlayer {
    Player player = Player(DeployedAddresses.Player());

    function testPlayerHas3Lives() public {
        uint lives = player.getLives();

        uint expected = 3;

        Assert.equal(lives, expected, "Player expected to start with 3 lives.");
    }

    function testPlayerHasNoCoins() public {
        uint money = player.getCoins();

        uint expected = 0;

        Assert.equal(money, expected, "Player expected to start with 0 coins.");
    }

    function testPlayerScoresCoins() public {
        player.score(100);

        Assert.equal(player.getCoins(), 100, "Player expected to have 100 coins.");
    }

    function testPlayerDies() public {
        player.die();

        Assert.equal(player.getLives(), 2, "Player expected to have 2 lives after losing 1.");
    }

    function testGameOver() public {
        player.die();
        player.die();

        Assert.equal(player.getLives(), 3, "Player lives should reset to 3 after losing all 3.");
        Assert.equal(player.getCoins(), 0, "Player coins should be reset to 0 after losing all 3 lives.");
    }
}