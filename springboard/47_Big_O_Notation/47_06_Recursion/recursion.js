/********** product: calculate the product of an array of numbers. **********/
function product(nums) {
  // if no numbers left to process, returning 1
  // since multiplying by 1 results in same output
  if (nums.length === 0) return 1;

  // returning last item in array => O(1)
  // then recursing
  return nums.pop() * product(nums);
}

/********** longest: return the length of the longest word in an array of words. **********/
function longest(words, max = 0) {
  // returning last item in array => O(1) 
  let word = words.pop();

  // if its length is bigger than our max value
  if (word.length > max) {
    // set the max value to the length
    max = word.length;
  }

  // if we reached the end of an array, return the maximum
  if (words.length === 0) return max;

  // otherwise, recurse with new array and new max value
  return longest(words, max);
}

/********** everyOther: return a string with every other letter. **********/
function everyOther(str, idx = 0) {
  // if we have reached the end of the string, return nothing
  if(str.length <= idx) { return ''; } 

  // if its not the end, check if even
  if (idx % 2 !== 0) {
    // if even, return empty char
    return '' + everyOther(str, ++idx);
  } 

  // if odd, return value
  return str[idx] + everyOther(str, ++idx);
  
}

/** isPalindrome: checks whether a string is a palindrome or not. **********/
function isPalindrome(str, idx = 0) {
  // checking if the index is over the length/2 of the string
  // if so, we should stop, so we are returning true
  // true is a neutral answer because
  // true * true = true
  // false * true = false
  // ^^^ 2nd true here is our neutral answer
 if(str.length / 2 <= idx) { return true; }

 // if we haven't reached the end of array
 // check [first] vs [last]
 // then [first+1] vs [last-1]
 // etc...

 // if two letter match
 if(str[idx] === str[str.length - 1 - idx]) {
  // return true and recurse
  // converting the return of 1 to Boolean
  return Boolean(true * isPalindrome(str, ++idx));
 } 
 // if don't match, return false and DON'T RECURSE
 // it only takes 1 false to make a word NOT a palendrome
 return false;
}

/********** findIndex: return the index of val in arr (or -1 if val is not present). **********/
function findIndex(arr, val, idx = 0) {
// if the index counter reached the end of array, not found, return -1
if(idx === arr.length) return -1;

// otherwise, start comparions
// if the item is what we need
if(arr[idx] === val) {
  // return the index of an item
  return idx;
}
// otherwise recurse with idx+1 before the value is passed
return findIndex(arr, val, ++idx);
}

/********** revString: return a copy of a string, but in reverse. **********/
function revString(str, idx = str.length - 1) {
// if we reach the beginning of string, stop recursing by returning ''
if(idx < 0) return '';
// otherwsie start from end and recurse backwards
return str[idx] + revString(str, --idx)
}

/********** gatherStrings: given an object, return an array of all of the string values. **********/
function gatherStrings(obj) {
let strArr = [];

for(let o in obj) {
  
  if(typeof(obj[o]) === "string") {
    // console.log("STRING")
    strArr.push(obj[o]);
  } 
  if(typeof(obj[o]) === "object") {
    // console.log(obj[o])
    strArr.push(...gatherStrings(obj[o]));
  }
}
return strArr;
}

/********** binarySearch: given a sorted array of numbers, and a value,
 * return the index of that value (or -1 if val is not present). **********/
function binarySearch(arr, val, left = 0, right = arr.length) {
if(left > right) return -1;

let middle = Math.floor((right + left) / 2);

if(arr[middle] === val) { return middle }

if(val > arr[middle]) {
  return binarySearch(arr, val, middle + 1, right)
} else {
  return binarySearch(arr, val, left, middle - 1)
} 
}

module.exports = {
  product,
  longest,
  everyOther,
  isPalindrome,
  findIndex,
  revString,
  gatherStrings,
  binarySearch
};
