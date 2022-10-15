import React from 'react';
import { useParams } from 'react-router-dom';

const DogDetails = (props) => {
    const { name } = useParams();

    const dog = props.dogs.filter(dog => dog.name === name);
    // console.log(dog[0])

    return (
        <>
            <h1>Hello, I'm {name}</h1>
            <img alt={name} src={`/${dog[0].src}.jpg`}></img>
            <h2>Im {dog[0].age} years old!</h2>

            <ul><strong>Here are some fun facts about me:</strong>
                {dog[0].facts.map(fact => <li key={fact}>{fact}</li>)}
            </ul>

        </>
    )

}

export default DogDetails;