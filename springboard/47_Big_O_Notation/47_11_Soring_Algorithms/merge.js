function merge(arr1, arr2) {
    let mergedArray = [];
    let arr1Pointer = 0;
    let arr2Pointer = 0;

    // run intil ONE of our pointers go above the length of arrays
    while(arr1Pointer < arr1.length && arr2Pointer < arr2.length) {
        if(arr1[arr1Pointer] < arr2[arr2Pointer]) {
            mergedArray.push(arr1[arr1Pointer]);
            arr1Pointer++;
        } else {
            mergedArray.push(arr2[arr2Pointer]);
            arr2Pointer++;
        }
    }

    // once at least ONE of our pointers exceed the length of ONE of the arrays

    // that means that array has been exhausted
    // so we just need to add the 2nd array values to the end
    
    // only one of these while loops will run because of the while loop condition at the top
    // this will only run after the top while loop is done
    while(arr1Pointer < arr1.length) {
        mergedArray.push(arr1[arr1Pointer]);
        arr1Pointer++;
    }

    while(arr2Pointer < arr2.length) {
        mergedArray.push(arr2[arr2Pointer]);
        arr2Pointer++;
    }

    // console.log(mergedArray);
    return mergedArray;
}

// will be using recursion for this
function mergeSort(unsortedArr) {
    // base / stop case
    // if the lenght of array is 0 or 1, its sorted, return it.
    // to the function that is CALLING IT. this is important
    if(unsortedArr.length <= 1) { return unsortedArr };

    // finding the middle piece of EACH passed unsorted array
    const middle = Math.floor(unsortedArr.length / 2);
    // recurse with left items (from begining to middle)
    const left = mergeSort(unsortedArr.slice(0,middle));
    // recurse with right items (from middle to end)
    const right = mergeSort(unsortedArr.slice(middle, unsortedArr.length))

    // each time this function is called, returning the merged version of the left and right 
    // which are results of the recursion 
    // in most cases, it will return value to THIS function itself
    return merge(left, right);
}

module.exports = { merge, mergeSort};

// PASS  ./merge.test.js
// merge
//   ✓ should exist (1 ms)
//   ✓ should be a pure function - in other words, it should not mutate the input arrays
//   ✓ should merge sorted arrays  (1 ms)

// mergeSort
//   ✓ should exist
//   ✓ should sort numbers in ascending order (1 ms)

// Test Suites: 1 passed, 1 total
// Tests:       5 passed, 5 total
// Snapshots:   0 total
// Time:        0.428 s, estimated 1 s