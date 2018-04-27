# Arithmattack!!!
_Distributed Applications midterm project_

```
Team: Aditya Aggarwal, Reuben Peter-Paul
```

Player will be presented with 2 numbers to sum together enter the submit the result. If the result is correct the user will be awarded 10 points. 
If the result is incorrect the player will lose one of their 3 lives and if they lose all their lives they forfeit their coins and their account 
resets with 3 lives.
 
A smart contract will be used to maintain a player's accumulated game coins, remaining lives.

## How to play

**Note: Arithmattack is currently only configured to run on a private test-net (and tested with Ganache and Ganache-cli)** 

You will need the latest Node JS platform (we used 9.0), and have installed the latest Truffle and Ganache-cli packages.

_(Optional: use docker container.)_

```bash
$ docker run --name arithmattack -ti -p 8080:8080 -p 8545:8545 node:9 bash
(or to access the container after it is running or restarted by calling: docker start arithmattack)
$ docker exec -ti -u 0 arithmattack bash
```

```bash
$ npm install -g truffle ganache-cli
$ nohup ganache-cli -a 1 &
```
(Note: the mnemonic can be retrieved from `nohup.out`, this will be needed for importing the account(s) using MetaMask.)

```bash
$ cd /usr/src
$ git clone https://github.com/scaryPonens/arithmattack.git
$ cd arithmattack
$ truffle migrate
$ npm install
$ npm run dev

> Arithm-attack@1.0.0 dev /root/arithmattack
> lite-server

** browser-sync config **
{ injectChanges: false,
  files: [ './**/*.{html,htm,css,js}' ],
  watchOptions: { ignored: 'node_modules' },
  server:
   { baseDir: [ './src', './build/contracts' ],
     middleware: [ [Function], [Function] ] },
  port: 8080 }
[Browsersync] Access URLs:
 -----------------------------------
       Local: http://localhost:8080
    External: http://172.17.0.2:8080
 -----------------------------------
          UI: http://localhost:3001
 UI External: http://172.17.0.2:3001
 -----------------------------------
```

You will need to use the MetaMask extension, I recommend following the step outlined in this tutorial:
http://truffleframework.com/tutorials/pet-shop

TODO:
* Add score modifier upgrades for purchase
* Add a game ladder
* Add a game chat room via whisper

