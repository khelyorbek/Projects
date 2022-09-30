import React, { useState } from 'react';

const EightBall = (props) => {
    // The EightBall will need state to keep track of the current color and message text, and this state should initially be “black” and “Think of a Question”.
    const [color, setColor] = useState('black');
    const [msg, setMsg] = useState('Think of a Question');

    // Make it so that the ball chooses a random message when it is clicked on. This should change the background color of the ball and the message.
    const pickRandom = () => {
        const randomNum = Math.floor(Math.random() * props.answers.length);
        // console.log(props.answers);
        const randomColor = props.answers[randomNum].color;
        const randomMsg = props.answers[randomNum].msg;
        setColor(randomColor);
        setMsg(randomMsg);
    }

    return <>
    <div onClick={() => pickRandom()} style={{backgroundColor: color, color: 'white', width:'4em', textAlign: 'center', padding: '8rem', borderRadius: '100%'}}>{msg}</div>
    
    </>
}

export default EightBall;
