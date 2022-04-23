const BASE_URL = 'http://deckofcardsapi.com/api/deck'

// 1
async function r1() {
    let res = await axios.get(`${BASE_URL}/new/draw`)
    console.log(`${res.data.cards[0].value} of ${res.data.cards[0].suit}`)
}
r1();


// 2
async function r2(){
    let res1 = await axios.get(`${BASE_URL}/new/draw`);
    console.log(res1.data.cards[0]);
    deck_id = res1.data.deck_id;

    let res2 = await axios.get(`${BASE_URL}/${deck_id}/draw`);
    console.log(res2.data.cards[0])
}
r2();


// 3
async function r3(){
    let res1 = await axios.get(`${BASE_URL}/new/shuffle`);
    p3_deck = res1.data.deck_id;

    const btn = document.getElementById('btnDrawCard');

    btn.addEventListener('click',async function(e){
        e.preventDefault();

        let res2 = await axios.get(`${BASE_URL}/${p3_deck}/draw`)
        let remaining = res2.data.remaining;

        console.log(`Cards remainign in deck: ${remaining}`)

        if(remaining>0) {
            const content = document.getElementById('content')
            let newImg = document.createElement("img")
        
            newImg.setAttribute('src',`${res2.data.cards[0].image}`)
            newImg.style.position = 'absolute';
            rand = Math.floor(Math.random() * (30 - -30 + 1) + -30)
            newImg.style.transform = `rotate(${rand}deg)`

            content.append(newImg)
        } else {
            alert('No cards left!')
        }
    })
}
r3();

