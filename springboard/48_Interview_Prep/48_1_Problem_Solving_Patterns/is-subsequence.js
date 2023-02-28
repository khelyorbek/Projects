// add whatever parameters you deem necessary
function isSubsequence(str, word) {
    // creating a counter so we can count the character passes in 1st string
    let strIdx = 0;

    // for every character in Word - O(n)
    for(let i=0;i<word.length;i++) {
        // console.log("str[strIdx]",str[strIdx]);
        // console.log("word[i]", word[i]);
        // console.log("? ", str[strIdx] === word[i])

        // compare if the character in str exists in word
        if(str[strIdx] === word[i]) {
            // if so, move to the next character in str
            strIdx++;
        }
    }
    // console.log(strIdx)

    // if all the characters in str have been account for
    if(strIdx === str.length) {
        // that means all the characters exist in word
        return true;
    }
    // otherwise either chars don't exist or order is incorrect
    return false;
}

console.log(isSubsequence('hello', 'hello world')) // true ***PASS***
console.log(isSubsequence('sing', 'sting')) // true ***PASS***
console.log(isSubsequence('abc', 'abracadabra')) // true ***PASS***
console.log(isSubsequence('abc', 'acb')) // false(order matters) ***PASS***