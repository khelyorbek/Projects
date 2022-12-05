// react components
import React, { useContext } from 'react';
import { Link } from "react-router-dom";

// importing the logo from the src folder
import logo from './logo.svg';

// custom component for currentUser Context
import GlobalContext from './GlobalContext';

// Bootcamp
import Container from 'react-bootstrap/Container';
import Button from 'react-bootstrap/Button';

const Home = () => {
    // destructuring the currentUser from the context
    const { currentUser } = useContext(GlobalContext);

    return (<>
        {/* returning a bootstrap container */}
        <Container className='text-center my-5'>
            {/* showing the logo with some styling */}
            <img src={logo} alt="logo" width='20%'></img>
            {/* showing h1 with the name of the app with some styling */}
            <h1 className='display-4 py-4'><strong>Jobly</strong></h1>
            {/* showing the description of the app with some styling */}
            <p className='display-6'>All the jobs in one, convenient place.</p>

            {/* if the user is logged in, greeting the user */}
            { currentUser 
            ? <p className='display-6'>Welcome back, {currentUser.firstName} {currentUser.lastName}</p>
            // otherwise showing 2 links that are buttons that take us to Login/signup
            : <>
                <Link to='/login'>
                    <Button size="lg" variant="primary" className="mx-2">Login</Button>
                </Link>
                <Link to='/signup'>
                    <Button size="lg" variant="info" className="mx-2">Sign up</Button>
                </Link>
              </>
            }
        </Container>
    </>)  
}

export default Home;

