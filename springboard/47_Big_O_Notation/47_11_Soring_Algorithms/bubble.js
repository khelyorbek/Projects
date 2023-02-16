function bubbleSort(numArray) {
    for(let i = 0; i < numArray.length; i++) {
        // keeping track if a swap has occured
        let swapped = false;

        // console.log("i==",numArray[i]);

        // running until lenghth - index of first loop
        // so we don't run the loop every time
        for(let j = 0; j < numArray.length - i; j++) {
            // console.log("j=",numArray[j]);

            if(numArray[j] > numArray[j+1]) {
                let temp = numArray[j+1];
                numArray[j+1] = numArray[j];
                numArray[j] = temp;
                // setting the swapping switch to true
                // so it case iterate again
                swapped = true;
            }        
        }
        // if the swap didn't occur when first loop finished
        // that means we are iterating over nothing
        // so we should stop for time complexity sake
        if(swapped === false) { break; }
    }
    console.log("FINAL SORTED: ", numArray);
    return numArray;
}

module.exports = bubbleSort;

// JEST UNIT TESTS
// PASS  ./bubble.test.js
//
//   ✓ should exist (1 ms)
//   ✓ should sort numbers in ascending order (31 ms)
         
// Test Suites: 1 passed, 1 total
// Tests:       2 passed, 2 total
// Snapshots:   0 total
// Time:        0.462 s, estimated 2 s