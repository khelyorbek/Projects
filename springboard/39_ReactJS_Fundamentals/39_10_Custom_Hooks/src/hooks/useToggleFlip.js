import React, {useState} from 'react';

const useToggleFlip = (inittialState = true) => {
    const [isFacingUp, setIsFacingUp] = useState(inittialState);

    const toggleFlip = () => {
        setIsFacingUp(!isFacingUp);
    }
    return [isFacingUp, toggleFlip];
}

export default useToggleFlip;