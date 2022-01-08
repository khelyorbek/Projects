function addKeyAndValue(arrOfObj, keyName, val) {
    let newArr = [];
    arrOfObj.forEach(function (obj) {
        obj[keyName] = val;
    })
    return arrOfObj;
}