const BASE_URL = 'http://deckofcardsapi.com/api/deck'

// 1
axios.get(`${BASE_URL}/new/draw`)
.then(res => {
    console.log(`${res.data.cards[0].value} of ${res.data.cards[0].suit}`)
})

// 2
axios.get(`${BASE_URL}/new/draw`)
.then(res => {
    console.log(res.data.cards[0])
    deck_id = res.data.deck_id
})
.then(() => {
    axios.get(`${BASE_URL}/${deck_id}/draw`)
    .then(res => {
        console.log(res.data.cards[0])
    })
})

// 3
axios.get(`${BASE_URL}/new/shuffle`)
.then(res => {
    p3_deck = res.data.deck_id;
    const btn = document.getElementById('btnDrawCard');
    btn.addEventListener('click',function(e){
        e.preventDefault();
        
        axios.get(`${BASE_URL}/${p3_deck}/draw`)
        .then(res => {
        let remaining = res.data.remaining;
        console.log(`Cards remainign in deck: ${remaining}`)

        if(remaining>0) {
            const content = document.getElementById('content')
            let newImg = document.createElement("img")
        
            newImg.setAttribute('src',`${res.data.cards[0].image}`)
            newImg.style.position = 'absolute';
            rand = Math.floor(Math.random() * (30 - -30 + 1) + -30)
            newImg.style.transform = `rotate(${rand}deg)`

            content.append(newImg)
        } else {
            alert('No cards left!')
        }
        
    })
    })
})