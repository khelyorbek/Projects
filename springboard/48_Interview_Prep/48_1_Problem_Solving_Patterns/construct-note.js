// add whatever parameters you deem necessary
function constructNote(msg, letters) {
    if(msg.length === 0) return true;
    if(letters.length === 0) return false;

    // creating frequency objects using our helper function
    // O(n)
    let msgFreq = buildFrequency(msg);
    let letFreq = buildFrequency(letters);

    console.log(msgFreq);
    console.log(letFreq);

    // for every key (letter count)
    for(let k in msgFreq) {
        // check if the frequency count of message
        // if larger than letters available
        if(msgFreq[k] > letFreq[k]) {
            // if not enough letters to write the message,
            // return false
            return false;
        }
    }
    // otherwise return true.
    return true;
}

// helper function for frequency counting
function buildFrequency(str) {
    let frequency = {};

    for(let i of str) {
        let currVal = frequency[i] || 0;
        frequency[i] = currVal + 1;
    }

    return frequency;
}

console.log(constructNote('aa', 'abc')) // false ***PASS***
console.log(constructNote('abc', 'dcba')) // true ***PASS***
console.log(constructNote('aabbcc', 'bcabcaddff')) // true ***PASS***