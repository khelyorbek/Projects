// Onload logic to display data into the UL
getAllCupcakes()

// Logic for grabbing the data from Flask API using Axios
async function getAllCupcakes() {
    let cupcakeList = document.getElementById('cupcakeList')

    let res = await axios.get('/api/cupcakes')
    cupcakes = res.data.cupcakes

    for(let cupcake of cupcakes){
        const newLi = document.createElement('li')
        newLi.innerHTML = `Flavor: ${cupcake.flavor}, Size: ${cupcake.size}, Rating: ${cupcake.rating}, <img src="${cupcake.image}" height="200px">`
        cupcakeList.append(newLi)
    }
    
}

// Logic for getting the data from input fields and calling addNewCupcake function
const newCupcakeBtn = document.getElementById('newCupcakeBtn');
newCupcakeBtn.addEventListener("click", function(e){
    e.preventDefault()

    const flavor = document.getElementById('flavor').value
    const size = document.getElementById('size').value
    const rating = document.getElementById('rating').value
    const image = document.getElementById('image').value

    addNewCupcake(flavor, size, rating, image)

    location.reload()
})

// Logic for adding the new cupcake using axios post request
async function addNewCupcake(flavor, size, rating, image) {
    let res = await axios.post('/api/cupcakes', {'flavor': flavor, 'size': size, 'rating': rating, 'image': image})
    return res.data
}
