// add whatever parameters you deem necessary
function sameFrequency(num1, num2) {
    let num1Freq = buildFrequency(num1);
    let num2Freq = buildFrequency(num2);

    // for every key 
    for(let k of num1Freq) {
        // console.log("K:",k)

        // check if the frequency count of num1
        // NOT equals to the frequency count of num2
        if(num1Freq.get(k[0]) !== num2Freq.get(k[0])) {
            // if not, then return false
            return false;
        }
    }
    // otherwise return true.
    return true;
}

// helper function for frequency counting
function buildFrequency(int) {
    // converting the int to a string first
    let str = int.toString();
    // creating a JS Map
    let frequency = new Map();

    // for each char in the string
    for(let i of str) {
        /// getting the current value of that key or setting to 0
        let currVal = frequency.get(i) || 0;
        // then incrementing by 1
        frequency.set(i, currVal + 1);
    }
    // console.log(frequency)
    return frequency;
}

console.log(sameFrequency(182,281)) // true ***PASS***
console.log(sameFrequency(34,14)) // false ***PASS***
console.log(sameFrequency(3589578, 5879385)) // true ***PASS***
console.log(sameFrequency(22,222)) // false ***PASS***