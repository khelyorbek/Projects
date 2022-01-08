function find(arr,val){
    return arr.filter(function(item) {
        if(item === val) {
            return val;
        } 
    })
    
}