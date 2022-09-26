const Person = (props) => {
    

    return (
        <div>
            <p>Learn some information about this person</p>
            <p>Name: {props.name.length > 8 ? props.name.slice(0,6) : props.name}</p>
            <p>Name: {props.age}</p>
            <ul>Hobbies: {props.hobbies.map(i => <li>{i}</li>)} </ul>
            <h3> {props.age > 18 ? 'Please go vote!' : 'You must be 18!'}</h3>
            <hr></hr>
        </div>
    );
}