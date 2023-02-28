// add whatever parameters you deem necessary
function averagePair(arr, soughtAvg) {
    let left = 0;
    let right = arr.length-1;

    // while left is smaller than the right
    while(left < right) {
        // calculate the avg of left and right pointer
        let calculatedAvg = (arr[left] + arr[right]) / 2;

        // if the calculated avg matches what we need
        if(calculatedAvg  === soughtAvg) {
            // return true
            return true;
        // otherwise check if  calculated avg is bigger
        } else if(calculatedAvg > soughtAvg) {
            // if so, our right pointer is too big, reduce
            right--;
        // otherwise check if  calculated avg is smaller
        } else {
            // if so, our left pinter is too small, increase
            left++;
        }
    }
    // if no matches found, return false in the end.
    return false;
}

console.log(averagePair([1, 2, 3], 2.5)); // true ***PASS***
console.log(averagePair([1, 3, 3, 5, 6, 7, 10, 12, 19], 8)); // true ***PASS***
console.log(averagePair([-1, 0, 3, 4, 5, 6], 4.1)); // false ***PASS***
console.log(averagePair([], 4)); // false ***PASS***