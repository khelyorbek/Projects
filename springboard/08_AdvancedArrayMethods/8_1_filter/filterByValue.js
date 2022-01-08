function filterByValue(objArr,key) {
    return objArr.filter(function (item) {
        return item[key];
    });
}