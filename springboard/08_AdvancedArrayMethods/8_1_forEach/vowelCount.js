function vowelCount(str) {
    // i was getting the forEach is not a function
    // and found the solution below
    let strToArr = str.split("");
    
    let vowCount = {};

    strToArr.forEach(function(item){
        let vowels = "aeiou";
        let lowercase = item.toLowerCase();
        
        if(vowels.indexOf(lowercase) !== -1) {
            if(isNaN(vowCount[lowercase])){
                vowCount[lowercase] = 1;    
            } else {
                vowCount[lowercase] += 1;
            }
            
        } 
    });
    return vowCount;
}