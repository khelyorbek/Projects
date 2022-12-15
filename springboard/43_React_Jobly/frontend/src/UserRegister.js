import React, { useState } from 'react';
import { useHistory } from "react-router-dom";

//Bootstrap
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';

// receiving the function passed to us via the Routes file
const UserRegister = ({ signup }) => {
    // for redirecting after successful registration
    const history = useHistory();
    // creating an initial state so we can initialize the form and clean it afterwards if necessary
    const initialState = {
        username: '',
        password: '',
        firstName: '',
        lastName: '',
        email: ''
    }

    // creating state to store form data and also setter function
    const [formData, setFormData] = useState(initialState);


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
        // calling the signup function that is passed to us all the way from App
        // and sending the data from the form
        let res = await signup(formData);

        // Once the signup process is done
        if (res === "complete") {
            history.push("/companies");
        }
    }

    return (<>
        <Container>
            <Row>
                <Col md={{ span: 6, offset: 3 }} >
                    <h1 className='display-6 my-3'>Sign up</h1>

                    {/* bootstrap form component. executes handleSubmit when the form is sent */}
                    <Form onSubmit={handleSubmit}>
                        <Form.Group className="mb-3" controlId="formBasicFirstName">
                            <Form.Label>First Name</Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} name="firstName" type="text" placeholder="Enter your first name" />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="formBasicLastName">
                            <Form.Label>Last Name</Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} name="lastName" type="text" placeholder="Enter your last name" />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="formBasicEmail">
                            <Form.Label>Email</Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} name="email" type="email" placeholder="Enter your email" />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="formBasicUsername">
                            <Form.Label>Username</Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} name="username" type="text" placeholder="Enter your username" />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="formBasicPassword">
                            <Form.Label>Password (minimum of 5 characters)</Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} name="password" type="password" placeholder="Enter your password" />
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

export default UserRegister;

