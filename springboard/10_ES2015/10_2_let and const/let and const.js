// ES5 Global Constants
// var PI = 3.14;
// PI = 42; // stop me from doing this!

// ES2015 Global Constants
const PI = 3.14;
PI = 42; // will error out see below

// let and const.js:7 Uncaught TypeError: Assignment to constant variable.
//     at let and const.js:7:4

// Quiz
// 1. What is the difference between var and let?
//      var lets you re-declare the variables
//      variable declared with var can be accessed from outside of the {}
//      variable declaration with var are hosited
//      let lets you re-assign values to a variable but not re-declare
//      variable declaration with let are not hosited


// 2. What is the difference between var and const?
//      var lets you re-declare the variables
//      variable declared with var can be accessed from outside of the {}
//      variable declaration with var are hosited
//      const prevents re-assigning and re-declaration of variable
//      variable declaration with cosnt are not hosited

// 3. What is the difference between let and const?
//      let allows you to re-assign value to a variable
//      const prevents you from re-assigning value to a variable

// 4. What is hoisting?
//      running the variable declarations first before anything is ran
//      a.k.a moving the variable declaration code to the top of js file