// add whatever parameters you deem necessary
function countPairs(nums, soughtSum) {
    let arrFreq = buildFrequency(nums);
    let pairCounter = 0;

    // console.log(arrFreq);
    // console.log(arrFreq.has(3))

    for(let num of nums) {
        let neededNum = soughtSum - num;

        // stopping the comparison to itself
        if(neededNum !== num) {
            // checking if the number that we need is in the map
            if(arrFreq.has(neededNum)) {
                pairCounter++;
            }
        }
        
    }
    
    // pairCounter will find each number that has a pair living in the array

    // so in the end I need to split it by 2 since the problem is asking for a number of pairs 
    // and not a number of items who HAVE a pair
    return pairCounter / 2;
}

// helper function for frequency counting
function buildFrequency(arr) {
    let frequency = new Map();

    for(let i of arr) {
        let currVal = frequency.get(i) || 0;
        frequency.set(i, currVal + 1);
    }

    return frequency;
}

console.log(countPairs([3,1,5,4,2], 6)) // 2 (1,5 and 2,4)
console.log(countPairs([10,4,8,2,6,0], 10)) // 3 (2,8, 4,6, 10,0)
console.log(countPairs([4,6,2,7], 10)) // 1 (4,6)
console.log(countPairs([1,2,3,4,5], 10)) // 0
console.log(countPairs([1,2,3,4,5], -3)) // 0
console.log(countPairs([0,-4],-4)) // 1
console.log(countPairs([1,2,3,0,-1,-2],0)) // 2


// Constraints
// Time Complexity - O(N * log(N)) <<<<<< WOULD USE SORTING. SLOWER
// or
// Time Complexity - O(N) <<<<<<<<<<<< MY SOLUTION