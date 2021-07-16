const gameContainer = document.getElementById("game");
// creating a variable that connect to the lowest score span
const lowestScore = document.querySelector("#lowestScore");

const COLORS = [
  "red",
  "blue",
  "green",
  "orange",
  "purple",
  "red",
  "blue",
  "green",
  "orange",
  "purple",
];

// here is a helper function to shuffle an array
// it returns the same array with values shuffled
// it is based on an algorithm called Fisher Yates if you want ot research more
function shuffle(array) {
  let counter = array.length;

  // While there are elements in the array
  while (counter > 0) {
    // Pick a random index
    let index = Math.floor(Math.random() * counter);

    // Decrease counter by 1
    counter--;

    // And swap the last element with it
    let temp = array[counter];
    array[counter] = array[index];
    array[index] = temp;
  }

  return array;
}

let shuffledColors = shuffle(COLORS);

// this function loops over the array of colors
// it creates a new div and gives it a class with the value of the color
// it also adds an event listener for a click for each card
function createDivsForColors(colorArray) {
  for (let color of colorArray) {
    // create a new div
    const newDiv = document.createElement("div");

    // give it a class attribute for the value we are looping over
    newDiv.classList.add(color);

    // call a function handleCardClick when a div is clicked on
    newDiv.addEventListener("click", handleCardClick);

    // append the div to the element with an id of game
    gameContainer.append(newDiv);
  }
}

// Creating a listener for the start button
const startGame = document.querySelector("#startGame");
startGame.addEventListener("click", function (event) {
  event.target.style.display = "none";
  document.querySelector("#game").style.display = "unset";
});

// creating an array to stay the bg colors of guessed items
let guessed = [];
// creating an array to store timer IDs for all the timeouts we created
let guessedTimers = [];
// creating a variable to store the amount of correct guesses so we can tell the user they won
let correctGuessed = 0;
// creating an array to store the offset left and offet top which we will use as unique ID for comparison
let offsetUID = [];
// creating a const value for a scoreboard span
const gameScore = document.querySelector("#scorePoints");
let gameScoreCounter = 0;

// TODO: Implement this function!
function handleCardClick(event) {
  // you can use event.target to see which element was clicked
  // console.log("you just clicked", event.target);

  // when a div is clicked it rotates 180 on x axis
  event.target.style.transform = "scale(-1,1)";

  // when a div is clicked it changes its bg color to the class that is assigned to it
  event.target.style.backgroundColor = event.target.classList;

  gameScoreCounter++;
  gameScore.innerText = gameScoreCounter;

  // adding the x and y offset of an element to create a unique ID
  offsetUID.push(event.target.offsetLeft + event.target.offsetTop);

  // once a div is pressed, it start a timer for 2s to return back to white color and rotate back on x axis
  guessedTimers.push(
    setTimeout(function () {
      event.target.style.backgroundColor = "white";
      event.target.style.transform = "scale(1,1)";
    }, 2000)
  );

  // when any div is pressed, its background color is pushed to an array that stores guesses
  guessed.push(event.target.style.backgroundColor);

  // console.log("Guess List " + guessed);
  if (guessed.length === 1) {
    // if only 1 card is selected and the user stops, everything resets
    setTimeout(function () {
      guessed = [];
      guessedTimers = [];
      offsetUID = [];
    }, 1900);

    // if 2 cards are selected, the follosing runs
  } else if (guessed.length === 2) {
    // immediately after pressing 2 divs, the mouse gets disabled
    gameContainer.style.pointerEvents = "none";

    //checking to see if the div that has been clicked is the same one
    if (offsetUID[0] === offsetUID[1]) {
      // for debugging only
      console.log("The card is the same one!!!");
      // if the card is the same one, nothing happens. everything resets
      setTimeout(function () {
        gameContainer.style.pointerEvents = "";
        guessed = [];
        guessedTimers = [];
        offsetUID = [];
      }, 1900);
    } else {
      // then js waits 2 second to re-enable the mouse input
      setTimeout(function () {
        gameContainer.style.pointerEvents = "";
      }, 1900);

      // if the first card guessed is the same as the second card
      if (guessed[0] === guessed[1]) {
        // logs into the console
        console.log("Match!");
        // add the to the counter of correct guesses
        correctGuessed++;
        // once the cards are matched properly, clearing out the timers so they don't fade back to white again
        clearTimeout(guessedTimers[0]);
        clearTimeout(guessedTimers[1]);
        // reseting arrays that house timers and correct guesses. This way everything starts from scratch
        guessed = [];
        guessedTimers = [];
        offsetUID = [];

        // if the first picked card is not the same as 2nd picked card, everything resets
      } else {
        setTimeout(function () {
          guessed = [];
          guessedTimers = [];
          offsetUID = [];
        }, 1900);
      }
    }
  }

  // since there are 10 cards and there can only be 5 correct guesses, creating a logic below for win message
  if (correctGuessed === 5) {
    // fnding the h2 that we have added to our html
    const winBox = document.querySelector("h2");
    // fnding the restart button that we have added to our html
    const restartBtn = document.querySelector("#restart");
    // setting a 1s timeout so use has time to register that they won
    setTimeout(function () {
      // unhiding the h2
      winBox.style.display = "unset";
      // hiding the main container that has the divs
      gameContainer.style.display = "none";
      // unhiding the button
      restartBtn.style.display = "unset";

      // comparing the lowest score to see if the current score is lower than that
      if (lowestScore.innerText > gameScoreCounter) {
        localStorage.setItem("lowestScore", gameScoreCounter);
      }

      restartBtn.addEventListener("click", function () {
        location.reload();
      });
    }, 1000);
  }
}

// when the DOM loads
createDivsForColors(shuffledColors);
// setting the span's text as the local variable.
lowestScore.innerText = localStorage.getItem("lowestScore");
