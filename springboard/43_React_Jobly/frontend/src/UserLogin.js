import React, { useState } from 'react';
import { useHistory } from "react-router-dom";

//Bootstrap
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Alert from 'react-bootstrap/Alert';

// receiving the function passed to us via the Routes file
const UserLogin = ({ login }) => {
      // for redirecting after successful login
      const history = useHistory();
    // creating an initial state so we can initialize the form and clean it afterwards if necessary
    const initialState = {
        username: '',
        password: ''
    }

    // creating state to store form data and also setter function
    const [formData, setFormData] = useState(initialState);
    // for storing and displaying errors
    const [formErrors, setFormErrors] = useState([]);

    // creating a universal changle handler function that stored values into state
    const handleChange = e => {
        // taking the target of the event and destructuing the name attribute and the value of the input
        const { name, value } = e.target;
        
        // setting the new value of the state
        setFormData(data => ({
            // to be the current value of the state
            ...data,
            // and whenever the new value is (Example: nameOfInput: valueOfInput)
            [name]: value
        }))
    }

    // creating a custom method to handle the submission of the form
    async function handleSubmit(e) {
        // preventing default behavior
        e.preventDefault();
        // calling the login function that is passed to us all the way from App
        // and sending the data from the form
        let res = await login(formData);

        // Once the login process is done
        if (res === "complete") {
            // warm redirecting user to the companies page
            history.push("/companies");
        } else {
            // if the login process is not successfull, loggin into console
            console.log("UserLogin > handleSubmith > else > ", res[0])
            // and setting the formErrors state so our alert can display
            setFormErrors(res[0]);
        }
    }


    return (<>
        <Container>
            <Row>
                <Col md={{ span: 6, offset: 3 }} >
                    {/* showing the alert if there are any errors to display */}
                    {formErrors.length 
                    ? <Alert className="my-1" key="danger" variant="danger">{formErrors}</Alert>
                    : ''}

                    <h1 className='display-6 my-3'>Log in</h1>
                    
                    {/* bootstrap form component. executes handleSubmit when the form is sent */}
                    <Form onSubmit={handleSubmit}>
                        <Form.Group className="mb-3" controlId="formBasicUsername">
                            <Form.Label>Username</Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} name="username" type="text" placeholder="Enter your username" />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="formBasicPassword">
                            <Form.Label>Password</Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} name="password" autoComplete="off" type="password" placeholder="Enter your password" />
                            <br></br>
                            <Form.Text className="text-muted">
                                Your username and password are encrypted and we do not share any information with anyone.
                            </Form.Text>
                        </Form.Group>
                        <Button variant="primary" type="submit">
                            Submit
                        </Button>
                    </Form>
                </Col>
            </Row>
        </Container>
    </>)

}

export default UserLogin;

