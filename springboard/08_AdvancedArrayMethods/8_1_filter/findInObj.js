function findInObj(objArr,key,val){
    return objArr.filter(function(item) {
        return item[key] === val;
    }).slice(0,1);
}