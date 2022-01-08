function extractFullName(objArr){
    return objArr.map(function (item) {
        return item.first + " " + item.last;
    })
}