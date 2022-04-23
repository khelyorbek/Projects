const BASE_URL = "http://numbersapi.com"

// 1
async function r1() {
  let res = await axios.get(`${BASE_URL}/7?json`)
  console.log(res.data)
}
r1();

// 2
async function r2() {
  for(let i=0;i<3;i++) {
    let res = await axios.get(`${BASE_URL}/${i}?json`)
    console.log(res.data)
}
}
r2();


// 3
let threePromises = [];
async function r3() {
  for(let i=0;i<4;i++) {
    threePromises.push(await axios.get(`${BASE_URL}/7?json`))
  };
  threePromises.forEach(n => console.log(n.data))
  
}
r3();
