import React from 'react';
import { useParams } from 'react-router-dom';

const Color = () => {
    const { colorName } = useParams();
    console.log(colorName);
    return (
        <>
            {colorName === "new" ? '' : <div style={{width:'100%',backgroundColor:`${colorName}`, height:'50vh'}}>{colorName}</div>}
        </>
    )
}

export default Color;