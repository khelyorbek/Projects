import React, { useState } from "react";
import Cell from "./Cell";
import "./Board.css";

/** Game board of Lights out.
 *
 * Properties:
 *
 * - nrows: number of rows of board
 * - ncols: number of cols of board
 * - chanceLightStartsOn: float, chance any cell is lit at start of game
 *
 * State:
 *
 * - board: array-of-arrays of true/false
 *
 *    For this board:
 *       .  .  .
 *       O  O  .     (where . is off, and O is on)
 *       .  .  .
 *
 *    This would be: [[f, f, f], [t, t, f], [f, f, f]]
 *
 *  This should render an HTML table of individual <Cell /> components.
 *
 *  This doesn't handle any clicks --- clicks are on individual cells
 *
 **/

function Board({ nrows = 5, ncols = 5, chanceLightStartsOn = 0.25 }) {
  const [board, setBoard] = useState(createBoard());
  
  /** create a board nrows high/ncols wide, each cell randomly lit or unlit */
  function createBoard() {
    let initialBoard = [];
    // TODO: create array-of-arrays of true/false values
    // generating rows
    for (let y = 0; y < nrows; y++) {
      let row = [];
      // generating each item in column
      for (let x = 0; x < ncols; x++) {
        // if the random num generated is greater than the change, the cell is true/lit
        // otherwise, the cell is false/dim
        row.push(Math.random() < chanceLightStartsOn);
      }
      // one the items are generated, pushing the entire row into the array
      initialBoard.push(row);
      
    }
    // returning the full array
    return initialBoard;
  }

  function hasWon() {
    // TODO: check the board in state to determine whether the player has won.

    // looping over each row
    for(let r=0;r<board.length;r++) {
      // looping over each column in a row
      for(let c=0;c<board[r].length;c++) {
        // checking if ANY cell says true
        if(board[r][c] === true) {
          // if ANY cell is true, then the player HASN'T WON yet
          return false;
        }
      }
    }
    // overwise, the user has won
    return true;
  }

  function flipCellsAround(coord) {
    setBoard(oldBoard => {
      const [y, x] = coord.split("-").map(Number);

      const flipCell = (y, x, boardCopy) => {
        // if this coord is actually on board, flip it

        if (x >= 0 && x < ncols && y >= 0 && y < nrows) {
          boardCopy[y][x] = !boardCopy[y][x];
        }
      };

      // TODO: Make a (deep) copy of the oldBoard
      const newBoard = structuredClone(oldBoard)

      // TODO: in the copy, flip this cell and the cells around it
      flipCell(y, x, newBoard);
      flipCell(y, x + 1, newBoard);
      flipCell(y, x - 1, newBoard);
      flipCell(y + 1, x, newBoard);
      flipCell(y - 1, x, newBoard);

      // TODO: return the copy
      return newBoard;
    });
  }

  // if the game is won, just show a winning msg & render nothing else

  // TODO
  if(hasWon() === true) {
    return <h1>Congratulation! You won</h1>;
  }
  

  // make table board

  // TODO
let fullTable = [];
  // looping through each row
  for (let y = 0; y < nrows; y++) {
    let row = [];
    // looping through eact item in row
    for (let x = 0; x < ncols; x++) {
      row.push(
        <Cell isLit={board[y][x]} flipCellsAroundMe={() => flipCellsAround(`${y}-${x}`)} key={`${y}-${x}`} />
      )
      // if the random num generated is greater than the change, the cell is true/lit
      // otherwise, the cell is false/dim
      row.push(Math.random() < chanceLightStartsOn);
    }

    // pushing the row full of components to table
    fullTable.push(<tr key={y}>{row}</tr>);
  }

  // rendering/returning the full board
  // checked Board.css and found that the class should be Board. Instructions kinda suck.
  return ( <table className="Board"> <tbody>{fullTable}</tbody> </table> );

}

export default Board;
