function countZeroes(arr) {
  // need to refactor this using O(log N)
  // not sure if the BigO for this. I think its O(n)

  // for(let i=0;i<arr.length-1;i++){
  //   if(arr[i]===0) {
  //     return arr.length - i;
  //   }
  // }
  // return 0;

  // refactored version
  let leftIdx = 0;
  let rightIdx = arr.length - 1;
  let middleIdx = Math.floor((leftIdx + rightIdx) / 2);
  let middleVal = arr[middleIdx];
  // debugger;
  while(leftIdx <= rightIdx) {
    // console.log("*****leftIdx = ", leftIdx);
    // console.log("*****rightIdx = ", rightIdx);
    // console.log("*****middleIdx = ", middleIdx);
    // console.log("*****middleVal = ", middleVal);
    if(middleVal === 1) {
      leftIdx = middleIdx + 1;
      middleIdx = Math.floor((leftIdx + rightIdx) / 2);
      middleVal = arr[middleIdx];
    } 
    else if(middleVal === 0) {
      if(arr[middleIdx - 1] === 1) {
        leftIdx = middleIdx;
        return arr.length - leftIdx;
      } else if(arr[middleIdx-1] === 0) {
        middleIdx--;
        middleVal = arr[middleIdx];
      } else {
        return arr.length - leftIdx;
      }
    }
  }
  return 0;
}

// console.log(countZeroes([1,1,1,1,0,0])); // 2
// console.log(countZeroes([1,0,0,0,0])); // 4
// console.log(countZeroes([0,0,0])); // 3
// console.log(countZeroes([1,1,1,1])); // 0

module.exports = countZeroes