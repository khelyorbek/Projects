const { mean, median, mode } = require('./methods');
describe('mean function', function(){
    test("mean should average numbers", function(){
        const arr = [1,2,3,4,5];
        const res = mean(arr);
        expect(res).toEqual(3);
    })
})

describe('median function', function(){
    test("median should return middle number from sorted array", function(){
        const arr = [5,3,2,1,4,6,7];
        const res = median(arr);
        expect(res).toEqual(4);
    })
})

describe('mode function', function(){
    test("mode should return the most popular number", function(){
        const arr = [1,1,2,3,4,5,6,7,7,7,7,7];
        const res = mode(arr);
        expect(res).toEqual(7);
    })
})