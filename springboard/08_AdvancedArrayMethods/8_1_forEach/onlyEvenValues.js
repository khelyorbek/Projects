function onlyEvenValues(arr) {
    let newArr = [];
    arr.forEach(function(num){
        if(num % 2 === 0) {
            newArr.push(num);
        }
        
    })
    return newArr;
}
