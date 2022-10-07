import React, {useState} from 'react';
import NewBoxForm from './NewBoxForm';
import Box from './Box';

const BoxList = () => {
    const INITIAL_STATE = [
        { width: '300', height: '300', bgColor: 'DeepSkyBlue'}
    ]

    // Place your state that contains all of the boxes here.
    const [allBoxes, setAllBoxes] = useState(INITIAL_STATE);

    // custom method to handle additions to our allBoxes state
    const addBox = (newBox) => {
        setAllBoxes(items => [...allBoxes, newBox]);
    }

    // custom method to handle removal of an item from the allboxes state
    const removeBox = (colorToRemove) => {
        setAllBoxes(allBoxes.filter(obj => obj.bgColor !== colorToRemove));
    }

    // This component should render all of the Box components along with the NewBoxForm component
    return (
    <>
    <NewBoxForm addBox={addBox}/>
    
    <div>
        {allBoxes.map(({width, height, bgColor}) => <Box width={width} height={height} bgColor={bgColor} key={bgColor} removeBox={removeBox} />)}
    </div>
    
    </>
        )
}

export default BoxList;