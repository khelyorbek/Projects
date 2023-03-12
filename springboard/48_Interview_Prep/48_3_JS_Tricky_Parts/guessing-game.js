function guessingGame() {
    // generating a random number between 1-99
    let randNum = Math.floor(Math.random()*99)
    // keeping track of the number of guesses it took the player
    let counter = 0;
    // keeping track if the game already ended
    let gameOver = false;

    // console.logging that number the first time (for testing)
    console.log("randNum is >>> ", randNum);

    // returning a function (closure)
    return function check(num) {
        // if the number passed is not a number
        // or if the number is not an int
        if(typeof num !== 'number' || Math.floor(num) !== num) return "Input error!"

        // if the game is not over yet
        if(gameOver === false) {
            // incrementing the counter by 1
            counter++;

            // checking if the number is the right one
            if(num === randNum) {
                gameOver = true;
                return `You win! You found ${randNum} in ${counter} guesses.`;
            } 
            // if the number is larger
            else if (num > randNum) {
                return `${num} is too high!`
            } 
            // if the number is lower
            else {
                return `${num} is too low!`;
            }
        }
        // if the game is already over 
        else {
            return "The game is over, you already won!";
        }
        
    }

}

module.exports = { guessingGame };

// PASS  ./guessing-game.test.js
// guessingGame
//   ✓ returns a function (4 ms)
//   ✓ tells you when your guess is too low (2 ms)
//   ✓ tells you when your guess is too high (3 ms)
//   ✓ tells you when your guess is correct, along with the number of guesses. (2 ms)
//   ✓ stops you from guessing when the game is over (2 ms)

// Test Suites: 1 passed, 1 total
// Tests:       5 passed, 5 total
// Snapshots:   0 total
// Time:        0.461 s, estimated 1 s