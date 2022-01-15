/** Connect Four
 *
 * Player 1 and 2 alternate turns. On each turn, a piece is dropped down a
 * column until a player gets four-in-a-row (horiz, vert, or diag) or until
 * board fills (tie)
 */

// >>> Adding my own custom code that will execute upon the page load <<<

// creating variables that store the start button, height and width sliders
const btnStart = document.getElementById('btnStart');
const heightInput = document.getElementById('height');
const widthInput = document.getElementById('width');

// initializing the values of width and height
let WIDTH = 7;
let HEIGHT = 6;

// Creating an event listener that will listen to a button click
btnStart.addEventListener('click', function (e) {
  // taking the value of the sliders and passing them into the width and height variables
  WIDTH = widthInput.value;
  HEIGHT = heightInput.value;

  // making the in-memory table
  makeBoard();
  // making the DOM board
  makeHtmlBoard();

  // removing the start selection screen
  document.getElementById('gameSettings').style.display = 'none';
  // making the table visible
  document.getElementById('game').style.visibility = 'visible';
})

// >>> End of custom code <<<

let currPlayer = 1; // active player: 1 or 2
const board = []; // array of rows, each row is array of cells  (board[y][x])


const makeBoard = () => {
  // TODO 3: set "board" to empty HEIGHT x WIDTH matrix array

  // creating a for loop that will iterate over height (y)
  for (let i = 0; i < HEIGHT; i++) {
    // on every iteration rest the jArr array to nothing so it can store values from the j for loop below
    let jArr = [];

    // creating a for loop that will iterate over width (x)
    for (let j = 0; j < WIDTH; j++) {
      // on every iterations, add a null into jArr
      jArr.push(null);
      // once this loop is done, we will have an array full of nulls that is WIDTH big
    }
    // close to the end of i for loop iteration, the jArr full of nulls will be added into our board array
    board.push(jArr);
  }
}

/** makeHtmlBoard: make HTML table and row of column tops. */

const makeHtmlBoard = () => {
  // TODO 4: get "htmlBoard" variable from the item in HTML w/ID of "board"
  const htmlBoard = document.querySelector('#board');

  // TODO 4: add comment for this code
  // Creating a new tr element called top that will house our clickable portion
  let top = document.createElement("tr");
  // Setting the id of the newly created element to column-top (which sets a dashed grey border)
  top.setAttribute("id", "column-top");
  // Adding an event listener that listens for left click
  top.addEventListener("click", handleClick);


  // creating a for loop to iterate over the width to creat a top row 
  // we don't need to iterate over height because we are only making 1 row
  for (let x = 0; x < WIDTH; x++) {
    // every time the loop runs, we create a new td element and calling it headCell
    let headCell = document.createElement("td");

    // setting the id of the element to the counter (from 0 to WIDTH)
    // this id will be later used to find the correct column based on the click
    headCell.setAttribute("id", x);

    // adding the newly created tds inside of a tr that we created before this for loop
    top.append(headCell);
  }
  // adding the clickable top tr with all tds inside to the main board 
  htmlBoard.append(top);

  // TODO 4: add comment for this code
  // creating a for loop to iterate over the set HEIGHT
  for (let y = 0; y < HEIGHT; y++) {
    // every time the loop runs, we create a new tr and call it row
    const row = document.createElement("tr");

    // creating a for loop to iterate over the set WIDTH
    for (let x = 0; x < WIDTH; x++) {

      // every time the WIDTH loop runs, we create a td and call it cell
      const cell = document.createElement("td");

      // set the id attribute of the newly created td to WIDTH counter-HEIGHT counter
      // Example: id="0-0" will be the top left element. 0-1 will be a td to the right of that. 1-0 is the one below.
      cell.setAttribute("id", `${y}-${x}`);

      // adding the newly created td into a tr called row
      row.append(cell);
    }
    // adding the entire row into the main board body 
    htmlBoard.append(row);
  }
}

/** findSpotForCol: given column x, return top empty y (null if filled) */

const findSpotForCol = (x) => {
  // TODO: write the real version of this, rather than always returning 0

  // creating an arraw to store all the cells that are null
  const nullCells = [];

  // using a for loop to iterate over each cell in a column
  // i starts at the HEIGHT-1 because tds are created start with 0
  // i keeps decreasing until it reaches a 0
  for (let i = HEIGHT - 1; i >= 0; i--) {
    // if the cell is null, its available as a valid spot
    if (board[i][x] === null) {
      // we add the i into the array. We store all the valid i numbers here starting with the largest one
      nullCells.push(i);
    }
  }

  // checking if an array is empty (meaning that we have no available cells) 
  if (nullCells.length === 0) {
    // returning null per the assignment instructions
    return null;
  } else {
    // if its not 0, we return the first index of an array which will be the largest number
    // largest number is the largest y axis. Which is the lowest cell in the table.
    return nullCells[0];
  }
}

/** placeInTable: update DOM to place piece into HTML table of board */

const placeInTable = (y, x) => {
  // TODO 5: make a div and insert into correct table cell
  // y and x are passed into this function as arguments

  // creating a div that will be placed inside of the td
  const square = document.createElement("div");

  // adding a piece class to the newly created div
  // we will use this piece class to set margins, width, height and border-radius
  square.classList.add("piece");

  // adding a class that will have the current player number
  // we will use this class later to set the background of the div based on the player
  square.classList.add("player" + currPlayer);


  // creating a new variable and storing the correct td into it
  // using string literals to find the td with the correct id
  const tdYX = document.getElementById(`${y}-${x}`);

  // appending the newly created div into the td with the id of y-x
  tdYX.append(square);
}

/** endGame: announce game end */

const endGame = (msg) => {
  // Creating a timer that waits for 0.8 seconds before saying annoucing a tie or a winner.
  // This is because we have a 0.7 second animation. We don't want to anounce a winnder before the piece falls onto the board.
  setTimeout(() => {

    // assigning h1 a value that is passed to this function
    document.getElementById('congrats').innerText = msg;

    // linking a variable to a button for refreshing
    const btnRefresh = document.getElementById('btnRefresh');

    // making the button visible
    btnRefresh.style.visibility = 'visible';

    // making the game table hidden
    document.getElementById('game').style.visibility = 'hidden';

    // adding an event listener and on click it will reload the page
    // button says "play again"
    btnRefresh.addEventListener('click', () => {
      location.reload();
    })
  }, 800);

}

/** handleClick: handle click of column top to play piece */

const handleClick = (evt) => {
  // get x from ID of clicked cell
  let x = +evt.target.id;

  // get next spot in column (if none, ignore click)
  let y = findSpotForCol(x);
  if (y === null) {
    return;
  }

  // updating an in-memory board
  board[y][x] = currPlayer;
  // place piece in board and add to HTML table
  placeInTable(y, x);

  // check for win
  if (checkForWin()) {
    return endGame(`Player ${currPlayer} won!`);
  }

  // TODO: check if all cells in board are filled; if so call, call endGame
  // Check every array item inside of a parent array to see if its filled
  if (board.every(y => y.every(x => x != null))) {
    // If all are filled, endGame function is initiated.
    endGame("Its a tie!")
  };

  // switch players
  // TODO: switch currPlayer 1 <-> 2
  currPlayer = (currPlayer === 1 ? 2 : 1);

}

/** checkForWin: check board cell-by-cell for "does a win start here?" */

const checkForWin = () => {
  function _win(cells) {
    // Check four cells to see if they're all color of current player
    //  - cells: list of four (y, x) cells
    //  - returns true if all are legal coordinates & all match currPlayer

    // returning true if every condition returns true
    return cells.every(
      ([y, x]) =>
        // making sure that x and y of the passed cell are valid numbers
        y >= 0 &&
        y < HEIGHT &&
        x >= 0 &&
        x < WIDTH &&
        // checking to make sure the cells are not empty (null = empty)
        board[y][x] === currPlayer
    );
  }

  // TODO: read and understand this code. Add comments to help you.
  // iterating over each row
  for (let y = 0; y < HEIGHT; y++) {
    //iterating over the width of the column
    for (let x = 0; x < WIDTH; x++) {
      // setting horiz to be an array of the curret item AND 3 more items to the right of it 
      let horiz = [[y, x], [y, x + 1], [y, x + 2], [y, x + 3]];
      // setting vert to be an array of the curret item AND 3 more items above it 
      let vert = [[y, x], [y + 1, x], [y + 2, x], [y + 3, x]];
      // setting diagDR to be an array of the curret item AND 3 more items to the right and to the top of it ^>
      let diagDR = [[y, x], [y + 1, x + 1], [y + 2, x + 2], [y + 3, x + 3]];
      // setting diagDL to be an array of the curret item AND 3 more items to the left and to the top of it ^<
      let diagDL = [[y, x], [y + 1, x - 1], [y + 2, x - 2], [y + 3, x - 3]];

      // if any of these return true, the function return true, meaning a win has been registered.
      if (_win(horiz) || _win(vert) || _win(diagDR) || _win(diagDL)) {
        return true;
      }
    }
  }
}


