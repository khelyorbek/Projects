function removeVowels(str) {
    let strArr = str.toLowerCase().split("");
    let vow = "aeiou";
    return strArr.filter(function(ch){
        return vow.indexOf(ch) === -1;
    })
}