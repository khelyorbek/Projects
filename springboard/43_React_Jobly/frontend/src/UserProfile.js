// react components
import React, { useState, useContext } from 'react';

// context
import GlobalContext from './GlobalContext';

// custom components
import JoblyApi from './api';

//Bootstrap
import Button from 'react-bootstrap/Button';
import Form from 'react-bootstrap/Form';
import Container from 'react-bootstrap/Container';
import Row from 'react-bootstrap/Row';
import Col from 'react-bootstrap/Col';
import Alert from 'react-bootstrap/Alert';


const UserProfile = ({ login }) => {
    // receiving context of currentUser
    const { currentUser, setCurrentUser } = useContext(GlobalContext);
    // using a an array in state to keep track of errors/alerts
    const [alertMsg, setAlertMsg] = useState([]);


    // creating an initial state so we can initialize the form and clean it afterwards if necessary
    const initialState = {
        password: '',
        firstName: currentUser.firstName,
        lastName: currentUser.lastName,
        email: currentUser.email
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

        // creting a vairable to receive and store the username and password
        const loginData = {
            password: formData.password,
            username: currentUser.username
        }
        // console.log("UserProfile > handleSubmit > loginData > ", loginData)

        // sending API request and passing the variable as an attribute
        // this checks the username and password to make sure the user is allowed to update the profile
        let resLogin = await login(loginData);

        // Once the LOGIN process is done 
        if (resLogin === "complete") {
            // show an alert/message to the user
            setAlertMsg("Profile update successful!");

            // making API call to update the profile, sending the current username and the data from the input forms
            let resUpdate = await JoblyApi.saveProfile(currentUser.username, formData);
            // console.log("UserProfile > handleSubmit > resUpdate", resUpdate);

            // setting the current user as the updated version of the user received from the API
            setCurrentUser(resUpdate);

        // if the LOGIN process is not successsful
        } else {
            // logging the error
            console.log("UserLogin > handleSubmith > else > ", resLogin[0])
            // showing an alert to the user
            setAlertMsg(resLogin[0]);
        }
    }

    return (<>
        <Container>
            <Row>
                <Col md={{ span: 6, offset: 3 }} >
                    {/* showing the alert if there are any errors to display */}
                    {alertMsg.length
                        ? <Alert className="my-1" key="info" variant="info">{alertMsg}</Alert>
                        : ''}
                    <h1 className='display-6 my-3'>Edit Profile</h1>

                    {/* bootstrap form component. executes handleSubmit when the form is sent */}
                    <Form onSubmit={handleSubmit}>
                        <Form.Group className="mb-3" controlId="formBasicUsername">
                            <Form.Label><strong>Username</strong></Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} plaintext name="username" type="text" defaultValue={currentUser.username} />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="formBasicFirstName">
                            <Form.Label><strong>First Name</strong></Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} name="firstName" type="text" defaultValue={currentUser.firstName} />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="formBasicLastName">
                            <Form.Label><strong>Last Name</strong></Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} name="lastName" type="text" defaultValue={currentUser.lastName} />
                        </Form.Group>
                        <Form.Group className="mb-3" controlId="formBasicEmail">
                            <Form.Label><strong>Email</strong></Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} name="email" type="email" defaultValue={currentUser.email} />
                        </Form.Group>

                        <Form.Group className="mb-3" controlId="formBasicPassword">
                            <Form.Label><strong>Confirm password to make changes</strong></Form.Label>
                            {/* calls the handleChange function when anything is typed/changed in the input */}
                            <Form.Control onChange={handleChange} name="password" type="password" />
                        </Form.Group>
                        <Button variant="primary" type="submit">
                            Update
                        </Button>
                    </Form>
                </Col>
            </Row>
        </Container>
    </>)

}

export default UserProfile;
