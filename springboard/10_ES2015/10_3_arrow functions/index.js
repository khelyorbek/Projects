// TASK 1. ES5 Map Callback
// function double(arr) {
//   return arr.map(function(val) {
//     return val * 2;
//   });
// }

//////////////////////////////////////////////////////

// ES2015 Arrow Functions Shorthand
// Refactor the above code to use two arrow functions. Turn it into a one-liner.

/* Write an ES2015 Version */
const double = (arr) => { arr.map((val) => val * 2) }

//OUT: undefined

//////////////////////////////////////////////////////

// TASK 2. Refactor the following function to use arrow functions:
// Replace ALL functions with arrow functions:

// function squareAndFindEvens(numbers){
//   var squares = numbers.map(function(num){
//     return num ** 2;
//   });
//   var evens = squares.filter(function(square){
//     return square % 2 === 0;
//   });
//   return evens;
// }

const square = (numbers) => { numbers.map((num) => num ** 2 ).filter((square) => square % 2 === 0 ); }

// OUT: undefined