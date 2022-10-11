import React, { useState, useEffect, useRef } from 'react';
import axios from 'axios';
import Card from './Card';

const Deck = () => {
    // for keeping track of our deckId
    const [deckId, setDeckId] = useState('default');
    // for keeping track of our cards
    const [cards, setCards] = useState([]);
    // for keeping track of our timer ID
    const [timerId, setTimerId] = useState();
    // for keeping track of our button ref
    const buttonRef = useRef();
    // for keeting track of the timer on / off status. default is off
    const [timerOn, setTimerOn] = useState(false);
    // global ref variable to pass the interval id between functions
    const intervalID = useRef(null);
    
    // for initializing the deck. only runs once
    useEffect(() => {
        async function getDeckId() {
            const res = await axios.get("https://deckofcardsapi.com/api/deck/new/shuffle/");
            setDeckId(res.data.deck_id);
        }

        getDeckId();
    }, [])

    // custom method for drawing a car
    const drawCard = () => {
        async function getNewCard() {

            // sending a GET request to API
            const res = await axios.get(`https://deckofcardsapi.com/api/deck/${deckId}/draw`);

            // logging the data that we receive
            console.log(res.data);

            // if the remaining cards are 0, will alert us
            if(res.data.remaining <= 0) { alert("You are out of cards! Please restart the game!") }
            
            // setting the cards state 
            setCards(() => {
                // to have current data plus the new data received
                return [...cards, res.data.cards[0].image];
            })

        }

        getNewCard();
    }

    // this runs any time there is a change to timerOn variable
    useEffect(() => {
        // if the timer on is set to true
        if(timerOn) {
            // setting the button ref inner HTML
            buttonRef.current.innerHTML = 'STOP drawing';
            // saving the Interval ID into a global ref
            // then making it call a custom function every 1 second
            intervalID.current = setInterval(() => {drawCard();},1000);
        }
    
        return () => clearInterval(intervalID.current);
    },[timerOn])

    // this occurs when a START Drawing button is pressed
    const flipTimer = () => {
        buttonRef.current.innerHTML = 'START drawing';
        // changing the timerOn variable which triggers the userEffect above
        setTimerOn(!timerOn);
    }

    return (
        <>
            <button onClick={drawCard} ref={buttonRef}>Draw a card</button>
            <button onClick={flipTimer} ref={buttonRef}>START drawing</button>
            <div id="Deck"> 
                {/* Setting the key to the name of the file which is unique */}
                { cards.map(card => <Card cardImg={card} key={card.slice(-6,-4)}/>)}
                
            </div>
            
        </>
    )
}

export default Deck;