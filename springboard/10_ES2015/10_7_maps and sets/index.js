function hasDuplicate(arr) {
    //creating a set which will only store unique values
    //then spreading using ... and turning set into Array
    const arrSet = [...new Set(arr)];
    // comparing the length of both arrays
    // if the new array is smaller than the orig array, there are duplicates
    return arr.length == arrSet.length;
}


function vowelCount(str) {
    const lowStr = [...str.toLowerCase()];
    const vowels = [...'aeiou'];
    const vowMap = new Map();

    // running a for of loop for every character of the string
    for(let char of lowStr) {
        // running a for of loop to compare it to every vowel
        for(let vow of vowels) {
            // if it matches, continue,
            // if not, do nothing
            if(char === vow) {
                // if a record in a map already exists
                if(vowMap.get(vow)){
                    // increase the value by 1
                    vowMap.set(vow,vowMap.get(vow)+1);
                } else {
                    // if a record doesn't exist
                    // create and set it to 1
                    vowMap.set(vow,1);
                }
            } 
        }
    }
    // output a map at the end
    console.log(vowMap);
}