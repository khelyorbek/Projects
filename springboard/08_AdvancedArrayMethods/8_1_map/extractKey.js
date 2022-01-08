function extractKey(objArr,key){
    return objArr.map(function (item) {
        return item[key];
    })
}