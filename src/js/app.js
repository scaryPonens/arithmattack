App = {
    web3Provider: null,
    contracts: {},

    init: function () {
        $("#value1").val(Math.floor(Math.random() * 90 + 10) + " ");
        $("#value2").val(Math.floor(Math.random() * 90 + 10) + " ");
        return App.initWeb3();
    },

    initWeb3: function () {
        // Is there an injected web3 instance?
        if (typeof web3 !== 'undefined') {
            App.web3Provider = web3.currentProvider;
        } else {
            // If no injected web3 instance is detected, fall back to Ganache
            App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
        }
        web3 = new Web3(App.web3Provider);
        return App.initContract();
    },

    initContract: function () {
        $.getJSON('Player.json', function (data) {
            // Get the necessary contract artifact file and instantiate it with truffle-contract
            var PlayerData = data;
            App.contracts.Player = TruffleContract(PlayerData);

            // Set the provider for our contract
            App.contracts.Player.setProvider(App.web3Provider);

            // Use our contract to retrieve and mark the adopted pets
            return App.playerState();
        });
        return App.bindEvents();
    },

    bindEvents: function () {
        $(document).on('click', '.btn-play', App.submitPlay);
    },

    playerState: function (player, account) {
        var playerInstance;

        App.contracts.Player.deployed().then(function (instance) {
            playerInstance = instance;

            return playerInstance.getLives.call();
        }).then(function (lives) {
            $("#remainingLives").text(lives.toNumber());
        }).catch(function (err) {
            console.log(err.message);
        });

        App.contracts.Player.deployed().then(function (instance) {
            playerInstance = instance;

            return playerInstance.getCoins.call();
        }).then(function (coins) {
            $('#numCoins').text(coins.toNumber());
        }).catch(function (err) {
            console.log(err.message);
        })
    },

    submitPlay: function (event) {
        event.preventDefault();

        var value1 = parseInt($("#value1").val());
        var value2 = parseInt($("#value2").val());
        var play = parseInt($("#answer").val());
        var answer = value1 + value2;
        var playerInstance;

        web3.eth.getAccounts(function (error, accounts) {
            if (error) {
                console.log(error);
            }

            var account = accounts[0];

            App.contracts.Player.deployed().then(function (instance) {
                playerInstance = instance;
                if ((play == answer)) {
                    return playerInstance.score(10, {from: account});
                }
                else {
                    return playerInstance.die({from: account});
                }
            }).then(function (result) {
                return App.playerState();
            }).catch(function (err) {
                console.log(err.message);
            });
        });
    }

};

$(function () {
    $(window).load(function () {
        App.init();
    });
});
