import React from 'react';

// this component should display a div with a background color, width and height based on the props passed to it.
const Box = (props) => {
    const handleRemove = (e) => {
        // console.log(e.target.bgColor);
        // console.log(props.bgColor);
        props.removeBox(props.bgColor);
    }

    return (<div style={{display: 'flex', fontSize: '3rem', alignItems: 'center', justifyContent: 'center', textAlign: 'center', width: `${props.width}px`, height: `${props.height}px`, backgroundColor: props.bgColor}} onClick={handleRemove}>REMOVE</div>)
}

export default Box;