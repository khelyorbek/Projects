// add whatever parameters you deem necessary
function twoArrayObject(chars, counts) {
    let final = {};

    for(let i = 0; i < chars.length; i++) {
        // console.log(i);
        
        let key = chars[i];
        let val = counts[i] || null;

        final[key] = val;
    }
    return final;
}

console.log(twoArrayObject(['a', 'b', 'c', 'd'], [1, 2, 3])) // {'a': 1, 'b': 2, 'c': 3, 'd': null} ***PASS***
console.log(twoArrayObject(['a', 'b', 'c'], [1, 2, 3, 4])) // {'a': 1, 'b': 2, 'c': 3} ***PASS***
console.log(twoArrayObject(['x', 'y', 'z'], [1, 2])) // {'x': 1, 'y': 2, 'z': null} ***PASS***