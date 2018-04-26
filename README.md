# Arithmattack!!!
_Distributed Applications midterm project_

```
Team: Aditya Aggarwal, Reuben Peter-Paul
```

Player will be presented with 2 numbers and be given a pre-set time to sum these number together and enter the result into the interface. If the result is correct the user will be awarded 10 points. If the result is incorrect the player will lose one of their 3 lives and if they lose all their lives they forfeit their coins and their account resets with 3 lives (they will not lose their purchases for that week.) There will be three rounds, the first round will contain 1-2 digit operands, the second round will contain 2 digit operands and the third round will contain 3 digit operands.  Each round will have 5 problems.  After three rounds the player's score will be converted to an internal alt-coin and added any pre-existing coins she has accumulated so far this week. At the end of the week the coins expire and are removed from the player's account. The player can use these coins to purchase upgrades for each week. The upgrades will consist of 3-levels of score multipliers, additional lives, a fourth round, 2 level 2 rounds instead of a level 3, etc.  These upgrades will have badges representing them and will be displayed when the user is playing.

A smart contract will be used to maintain a player's accumulated game coins, remaining lives and purchases. Another smart contract will be used to maintain a game ladder, the player's score on the ladder will be the sum of his coins and the value of his purchases.

