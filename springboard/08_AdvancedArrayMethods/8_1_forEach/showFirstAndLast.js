function showFirstAndLast(arr) {
    let newArr = [];
    arr.forEach(function(num){
        let fl = num.charAt(0) + num.slice(-1);
        newArr.push(fl);
    })
    return newArr;
}
