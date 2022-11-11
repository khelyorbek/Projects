function sortedFrequency(arr, num) {
    let leftIdx = 0;
    let rigtIdx = arr.length - 1;
    let rangeCounter = 1;
    let finalLeft = -1;
    let finalRight = -1;

    while ((finalLeft === -1 || finalRight === -1) && leftIdx <= rigtIdx) {
        let middIdx = Math.floor((leftIdx + rigtIdx) / 2);
        let middVal = arr[middIdx];

        
        if (middVal === num){
            if(middIdx === leftIdx) {
                return (rigtIdx - leftIdx) + 1;
            }
            else if (arr[middIdx - rangeCounter] < num) {
                leftIdx = middIdx - rangeCounter + 1;
                finalLeft = leftIdx;
                rangeCounter = 1;
            } 
            else if (arr[middIdx + rangeCounter] > num) {
                rigtIdx = middIdx + rangeCounter - 1;
                finalRight = rigtIdx;
                rangeCounter = 1;
            } 
            else { 
                rangeCounter++;
            }
        }
        else if (middVal > num) {
            rigtIdx = middIdx - 1;
        }
        else if (middVal < num) {
            leftIdx = middIdx + 1;
        }
        // console.log("\n*****leftIdx = ", leftIdx);
        // console.log("*****rightIdx = ", rigtIdx);
        // console.log("*****middleIdx = ", middIdx);
        // console.log("*****middleVal = ", middVal);
        // console.log("*****rangeCounter = ", rangeCounter);
        // console.log("Final left = ", finalLeft);
        // console.log("Final right = ", finalRight);
    }
    
    let answer = (rigtIdx - leftIdx) + 1;
    return answer === 0 ? -1 : answer;
}

console.log(sortedFrequency([1,1,2,2,2,2,3],2),"\n------"); // 4
console.log(sortedFrequency([1,1,2,2,2,2,3],3),"\n------"); // 1
console.log(sortedFrequency([1,1,2,2,2,2,3],1),"\n------"); // 2
console.log(sortedFrequency([1,1,2,2,2,2,3],4),"\n------");// -1

// L      M     R ---1
//              LR ---1
// [1,1,2,2,2,2,3],3

module.exports = sortedFrequency