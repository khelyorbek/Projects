// add whatever parameters you deem necessary
function separatePositive(arr) {
    let left = 0;
    let right = arr.length-1;

    // while left is smaller than the right
    while(left < right) {
        let l = arr[left];
        let r = arr[right];
        
        if(l > 0 && r > 0) {
            left++;
        } else if (l < 0 && r > 0) {
            arr[left] = r;
            arr[right] = l;
            left++;
        } else {
            right--;
        }
    }
    // if no matches found, return false in the end.
    return arr;
}

console.log(separatePositive([2, -1, -3, 6, -8, 10])) // [2, 10, 6, -3, -1, -8] ***PAS***
console.log(separatePositive([5, 10, -15, 20, 25])) // [5, 10, 25, 20, -15] ***PAS***
console.log(separatePositive([-5, 5])) // [5, -5] ***PAS***
console.log(separatePositive([1, 2, 3])) // [1, 2, 3] ***PAS***


//////////// WHITEBOARDING
// [2, -1, -3, 6, -8, 10]
//  L                 R
// L>0 = L++

// [2, -1, -3, 6, -8, 10]
//      L             R
// L<0 == SWAP

// [2, 10, -3, 6, -8, -1]
//      L              R
// L>0=L++

// [2, 10, -3, 6, -8, -1]
//          L          R
// L<0= R--???

// [2, 10, -3, 6, -8, -1]
//          L      R
// L<0= R--???

// [2, 10, -3, 6, -8, -1]
// 		L  R