function mean(intArr){
    let sum = 0;
    let len = intArr.length;

    for(let i of intArr) {
        sum += i;
    }

    return sum / len;
}

function median(intArr) {
    const sortedArr = intArr.sort();
    const m = sortedArr[parseInt(sortedArr.length / 2)];
    return m;
}

function mode(intArr) {
    let obj = {};
    
    for(let i of intArr) { obj[i] = 0 }
    for(let j of intArr) { obj[j] += 1 }

    let maxValue = 0;
    let maxIndex = 0;

    for(let k of Object.entries(obj)) { 
        

        if(k[1] >= maxValue) {
            maxValue = k[1];
            maxIndex = k[0];
        }
    }
    return intArr[maxIndex];
}

module.exports = { mean, median, mode };