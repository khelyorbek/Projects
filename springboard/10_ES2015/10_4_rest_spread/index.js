// 1. Given this function:

// function filterOutOdds() {
//   var nums = Array.prototype.slice.call(arguments);
//   return nums.filter(function(num) {
//     return num % 2 === 0
//   });
// }


// Refactor it to use the rest operator & an arrow function:
/* Write an ES2015 Version */
const filterOutOdds = (...nums) => nums.filter((num) => num % 2 === 0)

// CHECK
// filterOutOdds(1,2,3,4,5,6,7,8,9,0)
// (5) [2, 4, 6, 8, 0]

/////////////////////////////////////////////////////////////////////

// 2. findMin
// Write a function called findMin that accepts a variable number of arguments and returns the smallest argument.

// Make sure to do this using the rest and spread operator.

// findMin(1,4,12,-3) // -3
// findMin(1,-1) // -1
// findMin(3,1) // 1

const findMin = (...nums) => Math.min(...nums);

// CHECK
// findMin(23,5,99,400,950,32,76)
// 5

/////////////////////////////////////////////////////////////////////

// 3. mergeObjects
// Write a function called mergeObjects that accepts two objects and returns a new object which contains all the keys and values of the first object and second object.

// mergeObjects({a:1, b:2}, {c:3, d:4}) // {a:1, b:2, c:3, d:4}

const mergeObjects = (obj1,obj2) => {return {...obj1,...obj2}}

// CHECK
// mergeObjects({a:400, b:300}, {c:'hello', d:'world'})
// {a: 400, b: 300, c: 'hello', d: 'world'}

/////////////////////////////////////////////////////////////////////

// 4. doubleAndReturnArgs
// Write a function called doubleAndReturnArgs which accepts an array and a variable number of arguments. The function should return a new array with the original array values and all of additional arguments doubled.

// doubleAndReturnArgs([1,2,3],4,4) // [1,2,3,8,8]
// doubleAndReturnArgs([2],10,4) // [2, 20, 8]

const doubleAndReturnArgs = (arr,...nums) => {
    const doubleNums = [...nums].map(num => num*2);
    return [...arr,...doubleNums];
}

/////////////////////////////////////////////////////////////////////

// Slice and Dice!
// For this section, write the following functions using rest, spread and refactor these functions to be arrow functions!

// Make sure that you are always returning a new array or object and not modifying the existing inputs.

/** 5. remove a random element in the items array
and return a new array without that item. */

const removeRandom = (items) => {
    const rand = Math.floor(Math.random()*items.length);
    items.splice(rand,1);
    return items;
}
// CHECK
// removeRandom([1,2,3,4,5,6])
// (5) [1, 2, 4, 5, 6]



/** 6. Return a new array with every item in array1 and array2. */

const extend = (array1, array2) => {
    return [...array1,...array2]
}

// CHECK
// extend([1,2,3],[4,5,6])
// (6) [1, 2, 3, 4, 5, 6]



/** 7. Return a new object with all the keys and values
from obj and a new key/value pair */

const addKeyVal = (obj, key, val) => {
    return {...obj, [key]:val};
}

// CHECK
// addKeyVal({name:'Ely'},'gender','male')
// {name: 'Ely', gender: 'male'}


/** 8. Return a new object with a key removed. */

const removeKey = (obj, key) => {
    let newObj = {...obj};
    delete newObj[key];
    return newObj;
}

// CHECK
// removeKey({name:'Ely',gender:'Male'},'gender')
// {name: 'Ely'}


/** 9. Combine two objects and return a new object. */

const combine = (obj1, obj2) => {
    return {...obj1,...obj2};
}

// CHECK
// combine({name:'Ely',gender:'Male'},{title:'developer',company:'Google'})
// {name: 'Ely', gender: 'Male', title: 'developer', company: 'Google'}


/** 10. Return a new object with a modified key and value. */

const update = (obj, key, val) => {
    let newObj = {...obj};
    newObj[key] = val;
    return newObj;
}

// CHECK
// update({name:'Ely',gender:'Male',title:'developer',company:'Google'},'title','Software Architect')
// {name: 'Ely', gender: 'Male', title: 'Software Architect', company: 'Google'}