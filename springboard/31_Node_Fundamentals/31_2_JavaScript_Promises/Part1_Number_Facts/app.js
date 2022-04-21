const BASE_URL = "http://numbersapi.com"

// 1
axios.get(`${BASE_URL}/7?json`)
.then(res1 => console.log(res1.data))
.catch(err => console.log('Error!',err))

// 2
for(let i=0;i<3;i++) {
    axios.get(`${BASE_URL}/${i}?json`)
    .then(res2 => console.log(res2.data))
    .catch(err => console.log('Error!',err))
}

// 3
let threePromises = [];
for(let i=0;i<3;i++) {
    threePromises.push(axios.get(`${BASE_URL}/7?json`))
};

Promise.all(threePromises)
.then(numArr => (
  numArr.forEach(n => console.log(n.data))  
))