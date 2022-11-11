function findFloor(arr, num) {
  let leftIdx = 0;
  let righIdx = arr.length - 1;

  while (leftIdx <= righIdx) {
    let midIdx = Math.floor((leftIdx + righIdx) / 2);
    let midVal = arr[midIdx];
    // console.log("***midIdx = ", midIdx);

    if(num < arr[0]) {
        return -1;
    }
    else if(midVal > num) {
        righIdx = midIdx - 1;
        // console.log("***righIdx = ", righIdx);
    } else if(midVal < num) {
        if(arr[midIdx+1] === arr[midIdx] || arr[midIdx+1] < num) {
            leftIdx = midIdx + 1;
            // console.log("***leftIdx = ", leftIdx);
        } else {
            return arr[midIdx];
        }
    }

  }

}

console.log(findFloor([1,2,8,10,10,12,19], 9)); // 8
console.log(findFloor([1,2,8,10,10,12,19], 5)); // 2
console.log(findFloor([1,2,8,10,10,12,19], 20));// 19
console.log(findFloor([1,2,8,10,10,12,19], 0));// -1

module.exports = findFloor